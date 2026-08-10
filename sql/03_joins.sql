-- JOINs
SELECT p.pedido_id, p.data_pedido, c.nome AS cliente, c.regiao, p.status, p.canal_venda
FROM pedidos p JOIN clientes c ON c.cliente_id=p.cliente_id ORDER BY p.data_pedido DESC;

SELECT c.nome AS cliente, COUNT(DISTINCT p.pedido_id) AS quantidade_pedidos,
ROUND(SUM(i.quantidade*i.preco_unitario*(1-p.desconto_percentual)),2) AS receita_liquida
FROM clientes c JOIN pedidos p ON p.cliente_id=c.cliente_id
JOIN itens_pedido i ON i.pedido_id=p.pedido_id
WHERE p.status='Concluído'
GROUP BY c.cliente_id,c.nome ORDER BY receita_liquida DESC;
