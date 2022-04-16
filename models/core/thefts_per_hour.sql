{{ config(materialized='view') }}

SELECT
    date_start,
    hour,
    district_name,
    COUNT(*) / SUM(COUNT(*)) OVER(PARTITION BY date_start) AS share_of_day
FROM {{ ref('thefts_per_district') }}
GROUP BY date_start, hour, district_name
ORDER BY date_start, hour, district_name