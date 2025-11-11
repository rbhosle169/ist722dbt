{{ config(materialized='view') }}

with source_data as (
    select
        cast(EMPLOYEEID as number) as employee_id,
        LASTNAME                      as last_name,
        FIRSTNAME                     as first_name,
        TITLE                         as title,
        TITLEOFCOURTSEY               as title_of_courtsey,
        try_to_date(BIRTHDATE)        as birth_date,
        try_to_date(HIREDATE)         as hire_date,
        ADDRESS                       as address,
        CITY                          as city,
        REGION                        as region,
        POSTALCODE                    as postal_code,
        COUNTRY                       as country,
        HOMEPHONE                     as home_phone,
        EXTENSION                     as extension,
        NOTES                         as notes,
        REPORTSTO                     as reports_to
    from {{ source('raw_northwind', 'employees') }}
)

select *
from source_data
