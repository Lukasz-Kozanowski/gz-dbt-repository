WITH order_margin AS (
    SELECT
    ism.orders_id,
    ism.date_date,
    SUM(ism.revenue) AS revenue,
    SUM(ism.quantity) AS quantity,
    SUM(ism.purchse_cost) AS purchse_cost,
    SUM(ism.margin) AS margin
FROM {{ ref("int_sales_margin")}} ism
JOIN {{ ref("stg_raw__product")}} srp ON ism.products_id = srp.products_id
GROUP BY ism.orders_id, ism.date_date
)

SELECT
    orders_id,
    date_date,
    revenue,
    quantity,
    purchse_cost,
    margin
FROM order_margin