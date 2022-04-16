{{ config(materialized='table') }}

select
Gemeinde_name as district_name,
CAST(Gemeinde_schluessel as INT) as district_key
from {{ source('raw_data', 'berlin_districts_data') }}