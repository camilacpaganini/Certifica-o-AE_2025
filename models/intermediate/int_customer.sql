WITH customer AS (
    SELECT * FROM {{ ref('stg_customer') }}
),

person AS (
    SELECT * FROM {{ ref('stg_person') }}
),

store AS (
    SELECT * FROM {{ ref('stg_store') }}
),

address AS (
    SELECT * FROM {{ ref('stg_business_entity_address') }}
)

SELECT 
    c.pk_cliente,
    COALESCE(p.FIRSTNAME || ' ' || p.LASTNAME, s.nome_empresa, 'Cliente Desconhecido') AS nome_cliente,
    a.fk_endereco
FROM customer c
LEFT JOIN person p ON c.PERSONID = p.person_id
LEFT JOIN store s ON c.STOREID = s.store_id
LEFT JOIN address a ON c.pk_cliente = a.fk_cliente
