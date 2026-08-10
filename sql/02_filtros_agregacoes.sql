-- COUNT, SUM, AVG, GROUP BY, HAVING
SELECT status, COUNT(*) AS quantidade_pedidos FROM pedidos GROUP BY status ORDER BY quantidade_pedidos DESC;
SELECT canal_venda, COUNT(*) AS pedidos FROM pedidos GROUP BY canal_venda ORDER BY pedidos DESC;
SELECT categoria, ROUND(AVG(preco_venda),2) AS preco_medio, ROUND(MIN(preco_venda),2) AS menor_preco,
ROUND(MAX(preco_venda),2) AS maior_preco FROM produtos GROUP BY categoria;
SELECT forma_pagamento, COUNT(*) AS qtd_pagamentos, ROUND(SUM(valor_pago),2) AS valor_total
FROM pagamentos WHERE status_pagamento='Pago' GROUP BY forma_pagamento
HAVING SUM(valor_pago) > 10000 ORDER BY valor_total DESC;
