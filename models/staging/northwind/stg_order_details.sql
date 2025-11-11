{{ config(materialized='view') }}

with source_data as (
    select
        cast("ORDERID"    as number)        as order_id,
        cast("PRODUCTID"  as number)        as product_id,
        cast("UNITPRICE"  as number(10,2))  as unit_price,
        cast("QUANTITY"   as number)        as quantity,
        cast("DISCOUNT"   as number(5,2))   as discount
    from {{ source('raw_northwind', 'order_details') }}
)

select *
from source_data
