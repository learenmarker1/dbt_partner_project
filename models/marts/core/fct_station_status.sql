{{ config(
    tags=['hourly']
)}}

Select
    station_id,
    station_status,
    last_reported,
    available_ebikes,
    num_docks_available,
    num_docks_disabled,
    num_bikes_available,
    num_bikes_disabled,
    is_renting,
    is_installed,
    is_returning,
    legacy_id,
    eightd_has_key_dispenser
from {{ ref('stg_flatten_station_status') }}