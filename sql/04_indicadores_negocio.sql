-- Receita total, ticket médio e produtos
WITH valor_pedido AS (
 SELECT p.pedido_id,p.status,
 SUM(i.quantidade*i.preco_unitario)*(1-p.desconto_percentual) AS valor_liquido
 FROM pedidos p JOIN itens_pedido i ON i.pedido_id=p.pedido_id GROUP BY p.pedido_id
)
SELECT ROUND(SUM(valor_liquido),2) AS receita_total,
ROUND(AVG(valor_liquido),2) AS ticket_medio, COUNT(*) AS pedidos_concluidos
FROM valor_pedido WHERE status='Concluído';

SELECT pr.nome AS produto, SUM(i.quantidade) AS unidades_vendidas,
ROUND(SUM(i.quantidade*i.preco_unitario*(1-p.desconto_percentual)),2) AS receita
FROM itens_pedido i JOIN pedidos p ON p.pedido_id=i.pedido_id
JOIN produtos pr ON pr.produto_id=i.produto_id
WHERE p.status='Concluído'
GROUP BY pr.produto_id,pr.nome ORDER BY receita DESC;
