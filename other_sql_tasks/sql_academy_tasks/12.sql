-- https://sql-academy.org/ru/trainer/tasks/12

SELECT trip, COUNT(passenger) as count
FROM Pass_in_trip
GROUP BY trip