WITH operational_margin AS (
    SELECT
    om.orders_id,
    om.margin,
    om.date_date,
    om.purchse_cost,
    om.revenue,
    om.quantity,
    ship.shipping_fee,
    ship.ship_cost,
    ship.logcost
FROM {{ ref("int_orders_margin")}} om
JOIN {{ ref("stg_raw__ship")}} ship ON om.orders_id = ship.orders_id
)

SELECT
    orders_id,
    date_date,
    revenue,
    quantity,
    purchse_cost,
    shipping_fee,
    logcost,
    ship_cost,
    margin,
    margin + shipping_fee - logcost - ship_cost AS operational_margin
FROM operational_margin