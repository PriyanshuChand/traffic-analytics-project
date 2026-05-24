COPY traffic_trips
FROM 'C:/traffic_project/delhi_traffic_cleaned.csv'
DELIMITER ','
CSV HEADER;

SELECT COUNT(*) FROM traffic_trips;

SELECT * FROM traffic_trips LIMIT 10

