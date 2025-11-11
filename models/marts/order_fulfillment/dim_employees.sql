{{ config(materialized='table') }}

with base as (
  select
      employee_id,
      last_name,
      first_name,
      title,
      title_of_courtsey,
      birth_date,
      hire_date,
      address,
      city,
      region,
      postal_code,
      country,
      home_phone
  from {{ ref('stg_employees') }}
)

select *
from base
