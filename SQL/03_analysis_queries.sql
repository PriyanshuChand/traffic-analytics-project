-- Query 1: Analyze traffic congestion distribution by counting trips in each traffic density level
SELECT
    traffic_density_level,
    COUNT(*) AS total_trips
FROM traffic_trips
GROUP BY traffic_density_level
ORDER BY total_trips DESC;


-- Query 2: Analyze traffic activity patterns by counting total trips for each time of day
SELECT
    time_of_day,
    COUNT(*) AS total_trips
FROM traffic_trips
GROUP BY time_of_day
ORDER BY total_trips DESC;


-- Query 3: Analyze the impact of weather conditions on average vehicle speed
SELECT
    weather_condition,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed
FROM traffic_trips
GROUP BY weather_condition
ORDER BY avg_speed DESC;


-- Query 4: Compare average vehicle speed across different road types
SELECT
    road_type,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed
FROM traffic_trips
GROUP BY road_type
ORDER BY avg_speed DESC;


-- Query 5: Analyze congestion levels across different times of the day
SELECT
    time_of_day,
    traffic_density_level,
    COUNT(*) AS total_trips
FROM traffic_trips
GROUP BY time_of_day, traffic_density_level
ORDER BY time_of_day, total_trips DESC;


-- Query 6: Identify top 10 traffic congestion hotspots based on start areas
SELECT
    start_area,
    COUNT(*) AS total_trips
FROM traffic_trips
WHERE traffic_density_level IN ('High', 'Very High')
GROUP BY start_area
ORDER BY total_trips DESC
LIMIT 10;


-- Query 7: Identify top 10 congested destination areas based on end areas
SELECT
    end_area,
    COUNT(*) AS total_trips
FROM traffic_trips
WHERE traffic_density_level IN ('High', 'Very High')
GROUP BY end_area
ORDER BY total_trips DESC
LIMIT 10;


-- Query 8: Analyze most frequently traveled routes between start and destination areas
SELECT
    start_area,
    end_area,
    COUNT(*) AS total_trips
FROM traffic_trips
GROUP BY start_area, end_area
ORDER BY total_trips DESC
LIMIT 10;


-- Query 9: Identify slowest traffic routes based on average vehicle speed
SELECT
    start_area,
    end_area,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed
FROM traffic_trips
GROUP BY start_area, end_area
ORDER BY avg_speed ASC
LIMIT 10;