WITH 
    pedidos AS (
        SELECT * 
        FROM {{ ref('int_prep_fatos_pedidos') }}
    )

SELECT *
FROM pedidos
