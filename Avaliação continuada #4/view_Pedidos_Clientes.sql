CREATE VIEW Pedidos_Clientes AS
SELECT p.id_pedido, p.data_pedido, c.nome_cliente
FROM
    Pedidos p
JOIN
    Clientes c ON p.id_cliente = c.id_cliente;
