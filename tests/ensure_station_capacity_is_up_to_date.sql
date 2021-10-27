select
station_status.station_id as station_id,
station_status.available_ebikes
+station_status.num_docks_available
+station_status.num_docks_disabled
+station_status.num_bikes_available
+station_status.num_bikes_disabled 
as station_actual_capacity,
station_info.capacity as reported_capacity
from {{ref('fct_station_status')}} station_status
join {{ref('dim_station_info')}} station_info
using (station_id)
having (station_actual_capacity > reported_capacity and station_actual_capacity <> reported_capacity)