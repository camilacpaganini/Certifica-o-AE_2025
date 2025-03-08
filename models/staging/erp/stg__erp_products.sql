WITH product AS (
    SELECT
        PRODUCTID AS pk_produto,
        NAME AS nome_produto,
        PRODUCTSUBCATEGORYID
    FROM {{ source('erp', 'Product') }}
)

SELECT * FROM product
