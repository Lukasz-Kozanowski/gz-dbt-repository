SELECT
    finday.date_date,
    AVG(finday.operational_margin) - sum(campday.ads_cost) AS ads_margin,
    AVG(finday.average_basket) AS average_basket,
    AVG(finday.operational_margin) AS operational_margin

FROM {{ ref("finance_days")}} finday
JOIN {{ ref("int_campaigns_day")}} campday ON finday.date_date = campday.date_date
GROUP BY date_date
ORDER BY date_date DESC