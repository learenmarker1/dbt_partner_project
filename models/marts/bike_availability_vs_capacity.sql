with station_status as (
    select * from {{ ref('fct_station_status')}}
),

station_info as (
    select * from {{ ('dim_station_info')}}
),


capacity_availability as(
    select
        station_status.Station_id,
        station_info.station_name,
        station_status.Station_status,
        station_status.available_ebikes,
        station_status.num_docks_available,
        station_status.num_docks_disabled,
        station_status.num_bikes_available,
        station_status.num_bikes_disabled,
        station_status.is_renting,
        station_status.is_returning,
        station_info.capacity,
        station_status.available_ebikes+station_status.num_docks_available+station_status.num_docks_disabled+station_status.num_bikes_available+station_status.num_bikes_disabled as status_capacity
    from station_status
    join station_info using (station_id)
)

select * from capacity_availability