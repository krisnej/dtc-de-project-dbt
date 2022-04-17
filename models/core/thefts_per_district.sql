{{ config(materialized='view') }}

SELECT
    time_of_crime_start_day as date_start,
    time_of_crime_start_hour as hour,
    lor_name,
    district_name,
    amount_of_damage,
    type_of_bike
FROM {{ ref('stg_bike_data_cleaned') }} b
join {{ ref('stg_lor_data_cleaned') }} l
    on b.LOR=l.lor_key
join {{ ref('stg_districts_data_cleaned') }} d
    on l.district_key=d.district_key
WHERE 
    attempt is False