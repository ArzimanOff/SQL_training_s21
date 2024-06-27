-- https://sql-academy.org/ru/trainer/tasks/6

SELECT DISTINCT  name
FROM Company
JOIN Trip ON Trip.company = Company.id
WHERE plane = 'Boeing'