with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        CAST(orders_id AS INT64) AS orders_id,
        CAST(pdt_id AS INT64) AS pdt_id,
        CAST(revenue AS FLOAT64) AS revenue,
        CAST(quantity AS INT64) AS quantity

    from source

)

select * from renamed
