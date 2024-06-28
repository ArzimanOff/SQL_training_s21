-- https://sql-academy.org/ru/trainer/tasks/28

SELECT COUNT(*) as count
FROM Trip
WHERE town_from = 'Rostov' AND town_to = 'Moscow'