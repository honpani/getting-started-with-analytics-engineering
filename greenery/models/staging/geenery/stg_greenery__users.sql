WITH

SOURCE AS (

    SELECT * FROM {{ source('greenery', 'users') }}

),

FINAL AS (

    SELECT 
        user_id,
        created_at,
        updated_at,
        address_id
    FROM SOURCE

)


SELECT * FROM FINAL