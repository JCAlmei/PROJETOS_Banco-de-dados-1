-- Uma empresa de vendas tem um banco de dados com informações sobre os seus produtos. Ela precisa criar um relatório que faça um levantamento diário da quantidade de produtos comprados por dia. Para ajudar a empresa, crie um procedure para agilizar esse processo. --

CREATE PROCEDURE RelatorioDiarioVendas
AS
BEGIN
    SELECT 
        CAST(DataVenda AS DATE) AS Data,
        SUM(Quantidade) AS TotalVendas
    FROM 
        Vendas
    GROUP BY 
        CAST(DataVenda AS DATE)
    ORDER BY 
        Data DESC;
END;