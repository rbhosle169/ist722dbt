with source_data as (
  select
    cast(PRODUCTID as varchar)          as product_id,
    PRODUCTNAME                         as product_name,
    cast(SUPPLIERID  as varchar)        as supplier_id,
    cast(CATEGORYID  as varchar)        as category_id,
    QUANTITYPERUNIT                     as quantity_per_unit,
    round(UNITPRICE, 2)::number(10,2)   as unit_price,
    try_to_number(UNITSINSTOCK)         as units_in_stock,
    try_to_number(UNITSONORDER)         as units_on_order,
    try_to_number(REORDERLEVEL)         as reorder_level,
    case when DISCONTINUED in ('Y','y',1,true) then true else false end as is_discontinued
  from {{ source('raw_northwind','products') }}
)
select *
from source_data
