{{ config(
    materialized='table',
    partition_by={
      "field": "time_of_crime_start_day",
      "data_type": "date",
      "granularity": "day"
    },
    cluster_by = "LOR",
)}}

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
from {{ source('raw_data', 'berlin_bike_data') }} d
