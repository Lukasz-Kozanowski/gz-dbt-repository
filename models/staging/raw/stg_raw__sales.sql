with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        CAST(orders_id AS INT) AS orders_id,
        CAST(pdt_id AS INT) AS products_id,
        revenue,
        CAST(quantity AS INT) AS qty

    from source

)

select * from renamed
