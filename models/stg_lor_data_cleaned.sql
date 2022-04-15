{{ config(materialized='table') }}

select
    PLR_ID as lor_key,
    PLR_NAME as lor_name,
    CAST(BEZ AS INT) as district_key
from {{ source('raw_data', 'berlin_lor_data') }} d