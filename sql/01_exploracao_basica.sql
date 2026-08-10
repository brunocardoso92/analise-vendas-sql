-- SELECT, DISTINCT, WHERE, ORDER BY
SELECT * FROM clientes LIMIT 10;
SELECT DISTINCT categoria FROM produtos ORDER BY categoria;
SELECT nome, categoria, preco_venda FROM produtos WHERE preco_venda >= 500 ORDER BY preco_venda DESC;
SELECT pedido_id, cliente_id, data_pedido, status, canal_venda
FROM pedidos WHERE status = 'Concluído' ORDER BY data_pedido DESC LIMIT 20;
