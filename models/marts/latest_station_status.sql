with stat_info as (
    select * from {{ ref('stg_flatten_station_info')}}
),

stat_status as(
    select * from {{ref('stg_flatten_station_status')}}
),

latest_station_status as(

    select
        stat_status.STATION_ID as station_identity,
        stat_info.name,
        max(cast(stat_status.last_reported as datetime)) as last_reported_time,
        stat_status.station_status
    FROM stat_info
    INNER JOIN stat_status
    ON stat_info.station_id = stat_status.STATION_ID
GROUP BY stat_status.STATION_ID,
    stat_info.name,
    stat_status.station_status
ORDER BY stat_status.STATION_ID asc
)

select * from latest_station_status