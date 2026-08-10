-- ============================================================
-- 08. Análise Executiva de Desempenho de Vendas
-- ============================================================
-- Objetivo:
-- Consolidar indicadores relevantes para uma visão executiva
-- do desempenho comercial e financeiro.
--
-- Base de dados fictícia utilizada exclusivamente para estudo.
-- ============================================================


-- 1. RECEITA TOTAL
-- Considera apenas pedidos concluídos.

SELECT
    ROUND(
        SUM(
            i.quantidade * i.preco_unitario *
            (1 - p.desconto_percentual)
        ),
        2
    ) AS receita_total
FROM pedidos p
JOIN itens_pedido i
    ON i.pedido_id = p.pedido_id
WHERE p.status = 'Concluído';


-- ============================================================


-- 2. TICKET MÉDIO
-- Primeiro calculamos o valor total de cada pedido e,
-- posteriormente, a média entre os pedidos concluídos.

WITH valor_pedido AS (
    SELECT
        p.pedido_id,
        SUM(
            i.quantidade * i.preco_unitario *
            (1 - p.desconto_percentual)
        ) AS valor_total
    FROM pedidos p
    JOIN itens_pedido i
        ON i.pedido_id = p.pedido_id
    WHERE p.status = 'Concluído'
    GROUP BY p.pedido_id
)
SELECT
    ROUND(AVG(valor_total), 2) AS ticket_medio
FROM valor_pedido;


-- ============================================================


-- 3. CLIENTES COM MAIOR FATURAMENTO

SELECT
    c.nome AS cliente,
    c.regiao,
    COUNT(DISTINCT p.pedido_id) AS quantidade_pedidos,
    ROUND(
        SUM(
            i.quantidade * i.preco_unitario *
            (1 - p.desconto_percentual)
        ),
        2
    ) AS faturamento
FROM clientes c
JOIN pedidos p
    ON p.cliente_id = c.cliente_id
JOIN itens_pedido i
    ON i.pedido_id = p.pedido_id
WHERE p.status = 'Concluído'
GROUP BY
    c.cliente_id,
    c.nome,
    c.regiao
ORDER BY faturamento DESC;


-- ============================================================


-- 4. PRODUTOS COM MAIOR RECEITA

SELECT
    pr.nome AS produto,
    pr.categoria,
    SUM(i.quantidade) AS unidades_vendidas,
    ROUND(
        SUM(
            i.quantidade * i.preco_unitario *
            (1 - p.desconto_percentual)
        ),
        2
    ) AS receita
FROM produtos pr
JOIN itens_pedido i
    ON i.produto_id = pr.produto_id
JOIN pedidos p
    ON p.pedido_id = i.pedido_id
WHERE p.status = 'Concluído'
GROUP BY
    pr.produto_id,
    pr.nome,
    pr.categoria
ORDER BY receita DESC;


-- ============================================================


-- 5. VENDAS POR REGIÃO

SELECT
    c.regiao,
    COUNT(DISTINCT p.pedido_id) AS quantidade_pedidos,
    ROUND(
        SUM(
            i.quantidade * i.preco_unitario *
            (1 - p.desconto_percentual)
        ),
        2
    ) AS receita
FROM clientes c
JOIN pedidos p
    ON p.cliente_id = c.cliente_id
JOIN itens_pedido i
    ON i.pedido_id = p.pedido_id
WHERE p.status = 'Concluído'
GROUP BY c.regiao
ORDER BY receita DESC;


-- ============================================================


-- 6. PAGAMENTOS EM ABERTO
-- Considera pagamentos com status Pendente ou Atrasado.

SELECT
    c.nome AS cliente,
    c.regiao,
    p.pedido_id,
    pg.status_pagamento,
    pg.data_vencimento,
    ROUND(pg.valor_pago, 2) AS valor_em_aberto
FROM pagamentos pg
JOIN pedidos p
    ON p.pedido_id = pg.pedido_id
JOIN clientes c
    ON c.cliente_id = p.cliente_id
WHERE pg.status_pagamento IN ('Pendente', 'Atrasado')
ORDER BY pg.valor_pago DESC;


-- ============================================================


-- 7. PARTICIPAÇÃO PERCENTUAL DA RECEITA POR CATEGORIA

WITH receita_categoria AS (
    SELECT
        pr.categoria,
        SUM(
            i.quantidade * i.preco_unitario *
            (1 - p.desconto_percentual)
        ) AS receita
    FROM produtos pr
    JOIN itens_pedido i
        ON i.produto_id = pr.produto_id
    JOIN pedidos p
        ON p.pedido_id = i.pedido_id
    WHERE p.status = 'Concluído'
    GROUP BY pr.categoria
),
receita_total AS (
    SELECT SUM(receita) AS total
    FROM receita_categoria
)
SELECT
    rc.categoria,
    ROUND(rc.receita, 2) AS receita,
    ROUND(
        (rc.receita / rt.total) * 100,
        2
    ) AS participacao_percentual
FROM receita_categoria rc
CROSS JOIN receita_total rt
ORDER BY receita DESC;