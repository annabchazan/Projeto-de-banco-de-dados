CREATE VIEW Preco_Medio_Categorias AS
SELECT categoria, AVG(preco) AS media_preco
FROM
    Produtos
GROUP BY
    categoria;
