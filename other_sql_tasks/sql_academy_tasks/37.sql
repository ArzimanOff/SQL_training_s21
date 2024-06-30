-- https://sql-academy.org/ru/trainer/tasks/37

SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) as year FROM Student
ORDER BY birthday DESC
LIMIT 1