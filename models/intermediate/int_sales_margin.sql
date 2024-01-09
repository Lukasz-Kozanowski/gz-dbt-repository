WITH product_cost AS (
    SELECT
        q.products_id,
        q.quantity,
        pp.purchse_price,
        q.revenue
    FROM {{ source('raw', 'sales')}} q
    JOIN {{ source('raw', 'product')}} pp ON q.products_id = pp.products_id
)

SELECT
    pc.products_id,
    pc.quantity.
    pc.purchse_price,
    pc.revenue,
    (pc.quantity * pc.purchse_price) AS purchse_cost,
    (pc.revenue - (pc.quantity * pc.purchse_price)) AS margin
FROM product_cost pc