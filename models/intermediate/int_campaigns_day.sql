SELECT
    date_date,
    (date_date || '_' || paid_source || '_' || campaign_key) AS campaign_unique,
    sum(ads_cost) AS ads_cost,
    sum(impression) AS ads_impression,
    sum(click) AS ads_clicks,
FROM {{ ref("int_campaigns")}}
GROUP BY date_date, campaign_unique
ORDER BY date_date