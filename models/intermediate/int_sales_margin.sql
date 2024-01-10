WITH product_cost AS (
    SELECT
        q.date_date AS date_date,
        q.pdt_id AS products_id,
        q.orders_id AS orders_id,
        q.quantity AS quantity,
        pp.purchse_price AS purchse_price,
        q.revenue AS revenue
    FROM {{ ref("stg_raw__sales")}} q
    JOIN {{ ref("stg_raw__product")}} pp ON q.pdt_id = pp.products_id
)

SELECT
    pc.date_date,
    pc.products_id,
    pc.orders_id,
    pc.quantity,
    pc.purchse_price,
    pc.revenue,
    (pc.quantity * pc.purchse_price) AS purchse_cost,
    (pc.revenue - (pc.quantity * pc.purchse_price)) AS margin
FROM product_cost pc