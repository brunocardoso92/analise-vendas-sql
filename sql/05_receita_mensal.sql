-- Série temporal mensal
SELECT strftime('%Y-%m',p.data_pedido) AS mes,
COUNT(DISTINCT p.pedido_id) AS pedidos,
ROUND(SUM(i.quantidade*i.preco_unitario*(1-p.desconto_percentual)),2) AS receita
FROM pedidos p JOIN itens_pedido i ON i.pedido_id=p.pedido_id
WHERE p.status='Concluído'
GROUP BY strftime('%Y-%m',p.data_pedido) ORDER BY mes;
