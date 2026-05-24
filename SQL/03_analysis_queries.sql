SELECT
    traffic_density_level,
    COUNT(*) AS total_trips
FROM traffic_trips
GROUP BY traffic_density_level
ORDER BY total_trips DESC;


SELECT
    time_of_day,
    COUNT(*) AS total_trips
FROM traffic_trips
GROUP BY time_of_day
ORDER BY total_trips DESC;

SELECT
    weather_condition,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed
FROM traffic_trips
GROUP BY weather_condition
ORDER BY avg_speed DESC;

SELECT
    road_type,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed
FROM traffic_trips
GROUP BY road_type
ORDER BY avg_speed DESC;

SELECT
    time_of_day,
    traffic_density_level,
    COUNT(*) AS total_trips
FROM traffic_trips
GROUP BY time_of_day, traffic_density_level
ORDER BY time_of_day, total_trips DESC;

SELECT
    start_area,
    COUNT(*) AS total_trips
FROM traffic_trips
WHERE traffic_density_level IN ('High', 'Very High')
GROUP BY start_area
ORDER BY total_trips DESC
LIMIT 10;

SELECT
    end_area,
    COUNT(*) AS total_trips
FROM traffic_trips
WHERE traffic_density_level IN ('High', 'Very High')
GROUP BY end_area
ORDER BY total_trips DESC
LIMIT 10;

SELECT
    start_area,
    end_area,
    COUNT(*) AS total_trips
FROM traffic_trips
GROUP BY start_area, end_area
ORDER BY total_trips DESC
LIMIT 10;

SELECT
    start_area,
    end_area,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed
FROM traffic_trips
GROUP BY start_area, end_area
ORDER BY avg_speed ASC
LIMIT 10;