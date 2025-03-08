WITH business_entity_address AS (
    SELECT
        BUSINESSENTITYID AS fk_cliente,
        ADDRESSID AS fk_endereco
    FROM {{ source('erp', 'BusinessEntityAddress') }}
)

SELECT * FROM business_entity_address
