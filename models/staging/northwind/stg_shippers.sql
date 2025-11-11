{{ config(materialized='view') }}

with source_data as (
    select
        cast("SHIPPERID" as number)   as shipper_id,
        "COMPANYNAME"                 as company_name,
        "PHONE"                       as phone
    from {{ source('raw_northwind', 'shippers') }}
)

select *
from source_data
