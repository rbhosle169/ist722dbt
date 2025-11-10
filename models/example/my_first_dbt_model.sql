-- Submitted by: Rucha Bhosle (netid: rbhosle)
-- Edited for Assignment F setup
-- Safe starter model
-- This model just creates a simple table with one row

{{ config(materialized = 'table') }}

select 1 as id
