-- https://sql-academy.org/ru/trainer/tasks/5

SELECT COUNT(*) as count
FROM Trip
GROUP BY plane
HAVING plane='TU-134'