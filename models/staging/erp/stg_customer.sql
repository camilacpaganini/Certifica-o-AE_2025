WITH customer AS (
    SELECT
        CUSTOMERID AS pk_cliente,
        PERSONID,
        STOREID
    FROM {{ source('erp', 'Customer') }}
)

SELECT * FROM customer
