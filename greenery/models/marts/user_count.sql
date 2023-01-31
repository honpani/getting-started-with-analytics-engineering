-- SELECT COUNT(DISTINCT user_id) FROM public.users
SELECT COUNT(DISTINCT user_id)  AS value

FROM {{ ref('stg_greenery__users')}}
