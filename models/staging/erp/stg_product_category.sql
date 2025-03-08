WITH category AS (
    SELECT
        PRODUCTCATEGORYID,
        NAME AS categoria
    FROM {{ source('erp', 'ProductCategory') }}
)

SELECT * FROM category
