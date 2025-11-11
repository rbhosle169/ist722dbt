{{ config(materialized='view') }}

with source_data as (
    select
        cast("ORDERID"     as number)       as order_id,
        cast("EMPLOYEEID"  as number)       as employee_id,
        "CUSTOMERID"                         as customer_id,
        try_to_timestamp_ntz("ORDERDATE")    as order_date,
        try_to_timestamp_ntz("REQUIREDDATE") as required_date,
        try_to_timestamp_ntz("SHIPPEDDATE")  as shipped_date,
        cast("FREIGHT"     as number(18,2))  as freight,
        "SHIPVIA"                            as ship_via,
        "SHIPNAME"                           as ship_name,
        "SHIPADDRESS"                        as ship_address,
        "SHIPCITY"                           as ship_city,
        "SHIPREGION"                         as ship_region,
        "SHIPPOSTALCODE"                     as ship_postal_code,
        "SHIPCOUNTRY"                        as ship_country
    from {{ source('raw_northwind', 'orders') }}
)

select *
from source_data
