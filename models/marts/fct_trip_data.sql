{{ config(
    tags=['hourly']
)}}

select    
    tripduration,
    starttime,
    stoptime,
    start_id,
    start_name,
    start_lat,
    start_lon,
    end_id,
    end_name,
    end_lat,
    end_lon,
    bikeid,
    usertype, 
    "birth year", 
    gender
from {{ ref('stg_bike_data') }}