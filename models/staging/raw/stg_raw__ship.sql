with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        CAST(orders_id AS INT) AS orders_id,
        CAST(shipping_fee AS FLOAT) AS shipping_fee,
        CAST(shipping_fee_1 AS FLOAT) AS shipping_fee_1,
        logcost,
        ship_cost

    from source

)

select * from renamed
