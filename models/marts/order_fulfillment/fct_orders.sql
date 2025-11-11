{{ config(materialized='table') }}

with
o as (
  select * from {{ ref('stg_orders') }}
),

/* Define customer CTE and alias company_name → customer_name */
c as (
  select
    customer_id,
    company_name as customer_name   -- ✅ fixes invalid identifier
  from {{ ref('dim_customers') }}
),

e as (
  select
    employee_id,
    last_name as employee_last_name
  from {{ ref('dim_employees') }}
),

s as (
  select
    shipper_id,
    company_name as shipper_name
  from {{ ref('stg_shippers') }}
)

/* Final fact table join */
select
  o.order_id,
  o.customer_id,
  c.customer_name,
  o.employee_id,
  e.employee_last_name,
  o.order_date,
  o.required_date,
  o.shipped_date,
  o.freight,
  o.ship_name,
  o.ship_address,
  o.ship_city,
  o.ship_region,
  o.ship_postal_code,
  o.ship_country,
  o.ship_via,
  s.shipper_name
from o
left join c on o.customer_id = c.customer_id
left join e on o.employee_id = e.employee_id
left join s on o.ship_via    = s.shipper_id
