-- https://sql-academy.org/ru/trainer/tasks/9

SELECT DISTINCT name
FROM Company
JOIN Trip ON Company.id = Trip.company
WHERE town_from='Vladivostok'