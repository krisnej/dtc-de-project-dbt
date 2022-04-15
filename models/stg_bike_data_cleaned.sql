{{ config(materialized='table') }}

select
    parse_date("%d.%m.%Y", created_at) as create_at,
    parse_date("%d.%m.%Y", time_of_crime_start_day) as time_of_crime_start_day,
    time_of_crime_start_hour,
    parse_date("%d.%m.%Y", time_of_crime_end_day) as time_of_crime_end_day,
    time_of_crime_end_hour,
    LOR,
    amount_of_damage,
    CASE d.attempt
        WHEN "Nein" THEN False
        ELSE True
    END AS attempt,
    type_of_bike,
    offence,
    reason_of_data_capture
from {{ ref('berlin_bike_data') }} d
