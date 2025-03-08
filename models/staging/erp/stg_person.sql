WITH person AS (
    SELECT
        BUSINESSENTITYID AS person_id,
        FIRSTNAME,
        LASTNAME
    FROM {{ source('erp', 'Person') }}
)

SELECT * FROM person
