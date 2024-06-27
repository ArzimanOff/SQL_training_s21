-- https://sql-academy.org/ru/trainer/tasks/8

SELECT 
    town_to,
    TIMEDIFF(time_in, time_out) as flight_time
FROM Trip
WHERE town_from='Paris'