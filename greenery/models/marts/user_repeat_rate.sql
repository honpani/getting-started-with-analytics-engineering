WITH

ORDERS AS (

    SELECT * FROM {{ref('stg_greenery__orders')}}

),

ORDER_COHORT AS (

    SELECT user_id, COUNT(DISTINCT order_id) AS user_orders
    FROM ORDERS
    GROUP BY 1

),

USERS_BUCKET AS (

    SELECT user_id, (user_orders >=2)::int has_two_purchases
    FROM ORDER_COHORT

),

FINAL AS (

    SELECT
        SUM(has_two_purchases)::float / COUNT(DISTINCT user_id) AS repeat_rate
    FROM USERS_BUCKET
)

SELECT * FROM FINAL