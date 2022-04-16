{{ config(materialized='view') }}

SELECT
    date_start,
    hour,
    district_name,
    count(*) as thefts
FROM {{ ref('thefts_per_district') }}
group by date_start, hour, district_name