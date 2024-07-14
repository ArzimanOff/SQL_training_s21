-- https://sql-academy.org/ru/trainer/tasks/75

SELECT last_name,
	first_name,
	birthday
FROM Student
WHERE MONTH(birthday) = 05