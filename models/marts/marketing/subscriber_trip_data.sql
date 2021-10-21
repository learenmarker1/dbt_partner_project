{{
    config(
        tags=['daily']
    )
}}

select start_id, start_name, end_id, end_name, starttime, stoptime, trip_duration, "birth year", gender
from {{ ref('fct_trip_data') }}
where usertype='Subscriber'
