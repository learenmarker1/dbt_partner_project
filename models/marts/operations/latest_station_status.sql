select
        stat_status.STATION_ID as station_identity,
        stat_info.station_name,
        max(cast(stat_status.last_reported as datetime)) as last_reported_time,
        stat_status.station_status
    FROM {{ ref('dim_station_info')}} stat_info
    INNER JOIN {{ref('fct_station_status')}} stat_status
    ON stat_info.station_id = stat_status.STATION_ID
GROUP BY stat_status.STATION_ID,
    stat_info.station_name,
    stat_status.station_status
ORDER BY stat_status.STATION_ID asc
