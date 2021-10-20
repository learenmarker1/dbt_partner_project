with bike_data as(
    select
        tripduration,
        starttime,
        stoptime,
        "start station id" as start_id,
        "start station name" as start_name,
        "start station latitude" as start_lat,
        "start station longitude" as start_lon,
        "end station id" as end_id,
        "end station name" as end_name,
        "end station latitude" as end_lat,
        "end station longitude" as end_lon,
        bikeid,
        usertype, 
        "birth year", 
        gender
    from {{source('raw_source','bike_data')}}
)
   
select * from bike_data