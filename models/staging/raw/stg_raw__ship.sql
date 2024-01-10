with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        CAST(orders_id AS INT64) AS orders_id,
        CAST(shipping_fee AS FLOAT64) AS shipping_fee,
        CAST(shipping_fee_1 AS FLOAT64) AS shipping_fee_1,
        CAST(logcost AS FLOAT64) AS logcost,
        CAST(ship_cost AS INT64) AS ship_cost

    from source

)

select * from renamed
