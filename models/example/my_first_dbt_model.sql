-- Submitted by: Rucha Bhosle (netid: rbhosle)
-- Safe starter model
-- This model just creates a simple table with one row

{{ config(materialized = 'table') }}

select 1 as id
