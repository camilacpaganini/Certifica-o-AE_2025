WITH subcategory AS (
    SELECT
        PRODUCTSUBCATEGORYID,
        PRODUCTCATEGORYID,
        NAME AS subcategoria
    FROM {{ source('erp', 'ProductSubcategory') }}
)

SELECT * FROM subcategory
