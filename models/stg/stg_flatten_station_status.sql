Select
    value:station_id::INTEGER as station_id,
    value:station_status::STRING as station_status,
    value:num_ebikes_available::INTEGER as available_ebikes,
    value:num_docks_available::INTEGER as num_docks_available,
    value:num_docks_disabled::INTEGER as num_docks_disabled,
    value:num_bikes_available::INTEGER as num_bikes_available,
    value:num_bikes_disabled::INTEGER as num_bikes_disabled,
    value:is_renting::STRING as is_renting,
    value:is_installed::STRING as is_installed,
    value:is_returning::INTEGER as is_returning,
    value:last_reported::INTEGER as last_reported,
    value:legacy_id::INTEGER as legacy_id,
    value:eightd_has_key_dispenser::STRING as eightd_has_key_dispenser
from {{source('raw_source','stations_status_table')}}
, lateral flatten( input => station_status_raw:data:stations )
