WITH

SOURCE AS (

    SELECT * FROM {{ source('greenery', 'products')}}

),

FINAL AS (

SELECT
product_id,
name,
price,
inventory
FROM SOURCE

)

SELECT * FROM FINAL