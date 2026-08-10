-- Pagamentos pendentes e atrasados
SELECT pg.status_pagamento, COUNT(*) AS quantidade, ROUND(SUM(pg.valor_pago),2) AS valor_total
FROM pagamentos pg GROUP BY pg.status_pagamento ORDER BY valor_total DESC;

SELECT c.nome AS cliente, COUNT(*) AS titulos_em_aberto,
ROUND(SUM(pg.valor_pago),2) AS exposicao_total
FROM pagamentos pg JOIN pedidos p ON p.pedido_id=pg.pedido_id
JOIN clientes c ON c.cliente_id=p.cliente_id
WHERE pg.status_pagamento IN ('Pendente','Atrasado')
GROUP BY c.cliente_id,c.nome
HAVING SUM(pg.valor_pago)>3000 ORDER BY exposicao_total DESC;
