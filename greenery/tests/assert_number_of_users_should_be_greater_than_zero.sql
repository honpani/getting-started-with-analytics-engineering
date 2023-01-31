SELECT
    value

FROM {{ ref('user_count')}}
WHERE value <= 0