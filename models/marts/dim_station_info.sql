{{ config(
    tags=['daily']
)}}

select 
    station_id,
    name as station_name,
    short_name,
    lat,
    lon,
    region_id,
    rental_methods,
    capacity,
    rental_url,
    eightd_has_key_dispenser
from {{ ref('stg_flatten_station_info')}}