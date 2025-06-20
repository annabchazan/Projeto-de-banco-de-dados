CREATE VIEW Ranking_Vendas AS
WITH totais_gerais AS (
    SELECT
        SUM(quantidade) AS qtde_geral,
        SUM(preco_total) AS valor_geral
    FROM VENDAS
),
resumo_produto AS (
    SELECT
        id_produto,
        SUM(quantidade) AS qtde_produto,
        SUM(preco_total) AS valor_produto
    FROM VENDAS
    GROUP BY id_produto
)
SELECT
    r.id_produto,
    r.qtde_produto,
    r.valor_produto,
    ROUND((r.qtde_produto::DECIMAL / g.qtde_geral) * 100, 2) AS perc_quantidade,
    ROUND((r.valor_produto / g.valor_geral) * 100, 2) AS perc_valor
FROM
    resumo_produto r,
    totais_gerais g;
