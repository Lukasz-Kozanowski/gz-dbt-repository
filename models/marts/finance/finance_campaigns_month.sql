SELECT 
    {{ yearmonth('date_date')}} as month,
    SUM(ads_margin) as ads_margin,
    AVG(average_basket) as average_basket,
    AVG(operational_margin) AS operational_margin
FROM {{ ref("finance_campaigns_day")}}
GROUP BY month
ORDER BY month DESC