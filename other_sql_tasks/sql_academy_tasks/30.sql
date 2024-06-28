-- https://sql-academy.org/ru/trainer/tasks/30

SELECT trip, COUNT(trip) as count
FROM Pass_in_trip
GROUP BY trip
ORDER BY count DESC