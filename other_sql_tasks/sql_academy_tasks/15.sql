-- https://sql-academy.org/ru/trainer/tasks/15

SELECT time_in 
FROM Trip
JOIN Pass_in_trip
    ON Trip.id = Pass_in_trip.trip
JOIN Passenger
    ON Passenger.id = Pass_in_trip.passenger
WHERE 
    Passenger.name = 'Steve Martin' 
    AND 
    Trip.town_to = 'London'