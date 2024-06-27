-- https://sql-academy.org/ru/trainer/tasks/13

SELECT name FROM Passenger
GROUP BY name
HAVING  COUNT(name) <> 1