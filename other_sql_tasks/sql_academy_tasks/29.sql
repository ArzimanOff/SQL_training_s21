-- https://sql-academy.org/ru/trainer/tasks/29

SELECT DISTINCT 
    Passenger.name
FROM Trip
JOIN Pass_in_trip ON Pass_in_trip.trip = Trip.id
JOIN Passenger ON Passenger.id = Pass_in_trip.passenger
WHERE town_to = 'Moscow' AND plane = 'TU-134'
