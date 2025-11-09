-- Submitted by: Rucha Bhosle (netid: rbhosle)
-- Depends on the first model
-- Uses ref() to link to my_first_dbt_model

{{ config(materialized = 'table') }}

select id
from {{ ref('my_first_dbt_model') }}
where id = 1