with station_status as (
    select * from {{ ref('stg_flatten_station_status')}}
),

station_info as (
    select * from {{ ('stg_flatten_station_info')}}
),

capacity_availability as(
    select
        station_status.Station_id,
        station_info.name,
        station_status.Station_status,
        station_status.available_ebikes,
        station_status.num_docks_available,
        station_status.num_docks_disabled,
        station_status.num_bikes_available,
        station_status.num_bikes_disabled,
        station_status.is_renting,
        station_status.is_returning,
        station_info.capacity
    from station_status
    join station_info using (station_id)
)

select * from capacity_availability