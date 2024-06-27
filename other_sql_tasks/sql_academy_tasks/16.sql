-- https://sql-academy.org/ru/trainer/tasks/16

SELECT name, COUNT(*) as count
FROM Trip
JOIN Pass_in_trip
    ON Trip.id = Pass_in_trip.trip
JOIN Passenger
    ON Passenger.id = Pass_in_trip.passenger
GROUP BY name
ORDER BY count DESC, name