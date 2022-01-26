select count(*) from yellow_taxi_trips where date(tpep_pickup_datetime)='2021-01-15';

select * from yellow_taxi_trips order by tip_amount desc;

select "DOLocationID", dpu."Zone", COUNT(1) as "total_drops" from yellow_taxi_trips as trips 
INNER JOIN taxi_zones as z ON trips."PULocationID" = z."LocationID" 
INNER JOIN  taxi_zones as dpu ON trips."DOLocationID" = dpu."LocationID" 
where z."Zone" = 'Central Park' and date(tpep_pickup_datetime)='2021-01-14' 
GROUP BY "DOLocationID", dpu."Zone" ORDER BY "total_drops" DESC;

select "PULocationID", "DOLocationID", total_amount, CONCAT(zpu."Zone", ' / ', dpu."Zone")  from yellow_taxi_trips as t 
LEFT JOIN taxi_zones as zpu ON t."PULocationID" = zpu."LocationID" 
LEFT JOIN taxi_zones as dpu ON t."DOLocationID" = dpu."LocationID" 
order by total_amount desc;