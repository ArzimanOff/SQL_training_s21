-- https://sql-academy.org/ru/trainer/tasks/10

SELECT *
FROM Trip
WHERE time_out 
    BETWEEN '1900-01-01 10:00:00' AND '1900-01-01 14:00:00'