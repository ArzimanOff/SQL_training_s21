-- https://sql-academy.org/ru/trainer/tasks/14

SELECT town_to 
FROM Trip
JOIN Pass_in_trip
    ON Trip.id = Pass_in_trip.trip
JOIN Passenger 
    ON Pass_in_trip.passenger = Passenger.id
WHERE Passenger.name = 'Bruce Willis'