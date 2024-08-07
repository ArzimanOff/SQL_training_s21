-- https://sql-academy.org/ru/trainer/tasks/99

SELECT (SUM(price * items)) as income_from_female
FROM Purchases
WHERE user_gender LIKE "f%"