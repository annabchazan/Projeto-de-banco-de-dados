CREATE VIEW Vendas_Mensais AS
SELECT
    DATE_TRUNC('month', data_venda) AS mes,
    SUM(total_venda) AS total_mensal
FROM
    Vendas
GROUP BY
    DATE_TRUNC('month', data_venda)
