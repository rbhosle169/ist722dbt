{{ config(materialized='view') }}

with source_data as (

  select
    cast(CUSTOMERID        as varchar)  as customer_id,
    COMPANYNAME                         as company_name,
    CONTACTNAME                         as contact_name,
    CONTACTTITLE                        as contact_title,
    ADDRESS                             as address,
    CITY                                as city,
    REGION                              as region,
    POSTALCODE                          as postal_code,
    COUNTRY                             as country,
    PHONE                               as phone,
    FAX                                 as fax
  from {{ source('raw_northwind', 'customers') }}

)

select *
from source_data