{{ config(materialized='table') }}

with base as (
  select
      customer_id,
      company_name,      -- ✅ matches your staging column
      contact_name,
      contact_title,
      address,
      city,
      region,
      postal_code,
      country,
      phone
  from {{ ref('stg_customers') }}
)

select * from base
