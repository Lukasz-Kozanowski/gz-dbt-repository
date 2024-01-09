with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        CAST(orders_id AS INT) AS orders_id,
        pdt_id,
        revenue,
        CAST(quantity AS INT) AS qty

    from source

)

select * from renamed
