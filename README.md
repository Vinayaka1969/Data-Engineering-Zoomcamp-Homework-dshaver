HW3:

Created external table with the following SQL:
CREATE EXTERNAL TABLE IF NOT EXISTS dtc-de-course-485800.dtc_de_course_hw3.yellow_taxi_trip_data_2024
(
    VendorID Int64,
    passenger_count Int64,
    trip_distance float64,
    RatecodeID Int64,
    store_and_fwd_flag string,
    PULocationID Int64,
    DOLocationID Int64,
    payment_type Int64,
    fare_amount float64,
    extra float64,
    mta_tax float64,
    tip_amount float64,
    tolls_amount float64,
    improvement_surcharge float64,
    total_amount float64,
    congestion_surcharge float64
)
OPTIONS(
    format = 'PARQUET', 
    uris = ['gs://dtc_zoomcamp_hw3_2026/*'] 
);

#2. 
    SELECT COUNT(DISTINCT(VendorID)) FROM `dtc-de-course-485800.dtc_de_course_hw3.yellow_taxi_trip_data_2024` 
    vs
    SELECT COUNT(DISTINCT(VendorID)) FROM `dtc-de-course-485800.dtc_de_course_hw3.native_yellow_taxi_trip_data_2024`
    
#3.
    SELECT PULocationID FROM `dtc-de-course-485800.dtc_de_course_hw3.native_yellow_taxi_trip_data_2024`
    vs
    SELECT PULocationID, DOLocationID FROM `dtc-de-course-485800.dtc_de_course_hw3.native_yellow_taxi_trip_data_2024`

#4.
    SELECT count(*) FROM `dtc-de-course-485800.dtc_de_course_hw3.native_yellow_taxi_trip_data_2024`
    WHERE
      fare_amount = 0

#5.
    CREATE TABLE `dtc-de-course-485800.dtc_de_course_hw3.parted_and_clustered_yellow_data_2024`
    PARTITION BY DATE(tpep_dropoff_datetime)
    CLUSTER BY VendorID AS
    SELECT * FROM `dtc-de-course-485800.dtc_de_course_hw3.native_yellow_taxi_trip_data_2024`;

#6.
    Native table:
      SELECT DISTINCT(VendorID) FROM `dtc-de-course-485800.dtc_de_course_hw3.native_yellow_taxi_trip_data_2024`
      WHERE TIMESTAMP_TRUNC(tpep_dropoff_datetime, DAY) BETWEEN TIMESTAMP("2024-03-01") AND TIMESTAMP("2024-03-15");
    Partitioned and clustered table:
      SELECT DISTINCT(VendorID) FROM `dtc-de-course-485800.dtc_de_course_hw3.parted_and_clustered_yellow_data_2024`
      WHERE TIMESTAMP_TRUNC(tpep_dropoff_datetime, DAY) BETWEEN   TIMESTAMP("2024-03-01") AND TIMESTAMP("2024-03-15")

      



_________________________________________________________________________________________________________________________________________

HW2:

Used YAML script 09_gcp_taxi_scheduled.yaml to backfill all yellow and green taxi data from 01-01-2019 to 07-31-2021.

For questions 3, 4, and 5, used the following SQL to get row count for each month:
SELECT COUNT(*) FROM `dtc-de-course-485800.demo_dataset.green_tripdata_yyyy_mm`

then added totals in "HW2 row totals"
