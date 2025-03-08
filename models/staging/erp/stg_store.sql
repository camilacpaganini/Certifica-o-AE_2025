WITH store AS (
    SELECT
        BUSINESSENTITYID AS store_id,
        NAME AS nome_empresa
    FROM {{ source('erp', 'Store') }}
)

SELECT * FROM store
