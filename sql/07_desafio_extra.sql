-- CTE + função de janela
WITH receita_cliente AS (
 SELECT c.cliente_id,c.nome,c.regiao,
 SUM(i.quantidade*i.preco_unitario*(1-p.desconto_percentual)) AS receita
 FROM clientes c JOIN pedidos p ON p.cliente_id=c.cliente_id
 JOIN itens_pedido i ON i.pedido_id=p.pedido_id
 WHERE p.status='Concluído'
 GROUP BY c.cliente_id,c.nome,c.regiao
)
SELECT nome,regiao,ROUND(receita,2) AS receita,
DENSE_RANK() OVER (ORDER BY receita DESC) AS ranking_geral
FROM receita_cliente ORDER BY ranking_geral;
