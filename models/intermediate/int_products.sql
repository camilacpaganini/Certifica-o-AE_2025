WITH product AS (
    SELECT * FROM {{ ref('stg__erp_products') }}
),

subcategory AS (
    SELECT * FROM {{ ref('stg_product_subcategory') }}
),

category AS (
    SELECT * FROM {{ ref('stg_product_category') }}
)

SELECT 
    p.pk_produto,
    p.nome_produto,
    s.subcategoria,
    c.categoria
FROM product p
LEFT JOIN subcategory s ON p.PRODUCTSUBCATEGORYID = s.PRODUCTSUBCATEGORYID
LEFT JOIN category c ON s.PRODUCTCATEGORYID = c.PRODUCTCATEGORYID
