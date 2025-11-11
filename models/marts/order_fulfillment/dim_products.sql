{{ config(materialized='table') }}

with p as (
  select *
  from {{ ref('stg_products') }}
)

select
  p.product_id,
  p.product_name,
  p.supplier_id,
  p.category_id,
  p.quantity_per_unit,
  p.unit_price,
  p.units_in_stock,
  p.units_on_order,
  p.reorder_level,
  p.is_discontinued
from p
