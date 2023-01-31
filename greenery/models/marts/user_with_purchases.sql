WITH user_with_purchases AS (
SELECT user_id,
CASE WHEN COUNT(order_id) = 1 THEN '1'
WHEN COUNT(order_id) = 2 THEN '2'
WHEN COUNT(order_id) >= 3 THEN '3+' 
END AS purchase 
FROM {{ ref('stg_greenery__orders')}}
GROUP BY 1
)

SELECT purchase, COUNT(1) AS user_count
FROM user_with_purchases
GROUP BY 1