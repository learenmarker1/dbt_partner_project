{{ config(
    tags=['monthly']
)}}

select CONCAT(YEAR(starttime),'-',MONTHNAME(starttime)) as year_month, 
    count(case when gender=1 then 1 end) as male_sub, 
    count(case when gender=2 then 1 end) as female_sub,
    count(case when gender=0 then 1 end) as unknown_cust 
from {{ ref('fct_trip_data')}} station_status
group by year_month, year(starttime), month(starttime)
order by year(starttime), month(starttime)

