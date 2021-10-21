{{ config(
    tags=['hourly']
)}}

select    
    start_id,
    start_name,
    start_lat,
    start_lon,
    end_id,
    end_name,
    end_lat,
    end_lon,
    starttime,
    stoptime,    
    trip_duration,
    bikeid,
    usertype, 
    "birth year", 
    gender
from {{ ref('stg_bike_data') }}