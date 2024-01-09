WITH product_cost AS (
    SELECT
        q.pdt_id AS products_id,
        q.quantity AS quantity,
        pp.purchse_price AS purchse_price,
        q.revenue AS revenue
    FROM {{ source('raw', 'sales')}} q
    JOIN {{ source('raw', 'product')}} pp ON q.pdt_id = pp.products_id
)

SELECT
    pc.products_id,
    pc.quantity,
    pc.purchse_price,
    pc.revenue,
    (pc.quantity * pc.purchse_price) AS purchse_cost,
    (pc.revenue - (pc.quantity * pc.purchse_price)) AS margin
FROM product_cost pc