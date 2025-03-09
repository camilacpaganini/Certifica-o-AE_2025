WITH dim_motivos_venda AS (
    SELECT *
    FROM {{ ref('int_salesreson') }}
)

SELECT * FROM dim_motivos_venda
