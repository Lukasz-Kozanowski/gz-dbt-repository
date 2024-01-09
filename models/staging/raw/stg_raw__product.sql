with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        CAST(products_id AS INT) AS products_id,
        CAST(purchse_price AS FLOAT) AS purchse_price

    from source

)

select * from renamed
