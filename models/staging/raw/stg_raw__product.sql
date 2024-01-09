with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        CAST(products_id AS INT64) AS products_id,
        CAST(purchse_price AS FLOAT64) AS purchse_price

    from source

)

select * from renamed
