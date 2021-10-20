with station_info as(
    Select
        value:station_id::INTEGER as station_id,
        value:name::STRING as name,
        value:short_name::STRING as short_name,
        value:lat::NUMBER (9, 6) as lat,
        value:lon::NUMBER (9, 6) as lon,
        value:region_id::INTEGER as region_id,
        value:rental_methods::STRING as rental_methods,
        value:capacity::INTEGER as capacity,
        value:rental_url::STRING as rental_url,
        value:eightd_has_key_dispenser::STRING as eightd_has_key_dispenser
    from {{source('raw_source','station_info')}}
, lateral flatten( input => src:data:stations )
)

select * from station_info