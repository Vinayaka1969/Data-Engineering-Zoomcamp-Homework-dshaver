with green_tripdata as (
    select * from {{ref('stg_green_tripdata')}} 
),

yellow_tripdata as (
    select * from {{ref('stg_yellow_tripdata')}}
),

trips_unioned as (
    select * from green_tripdata
    union all
    select * from yellow_tripdata
)

select * from trips_unioned