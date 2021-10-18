with station_status as(
    select * from {{ ref('stg_bike_data')}}
),

final as(
    select count(usertype)
from station_status
where usertype like 'Subscriber'
)

select * from final
