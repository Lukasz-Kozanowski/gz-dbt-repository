SELECT
    finday.date_date,
    sum(finday.operational_margin) - sum(campday.ads_cost) AS ads_margin,
    sum(finday.average_basket) AS average_basket,
    sum(finday.operational_margin) AS operational_margin

FROM `nifty-caster-407109.dbt_.finance_days` finday
JOIN {{ ref("int_campaigns_day")}} campday ON finday.date_date = campday.date_date
GROUP BY date_date