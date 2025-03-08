WITH cartao AS (
    SELECT
        CREDITCARDID AS pk_cartao,
        CARDTYPE AS tipo_cartao
    FROM {{ source('erp', 'CreditCard') }}
)

SELECT * FROM cartao
