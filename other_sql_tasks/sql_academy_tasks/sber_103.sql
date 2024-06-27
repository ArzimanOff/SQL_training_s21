-- Тестовое задание сбербанк
-- https://sql-academy.org/ru/trainer/tasks/103

SELECT empl.name
FROM Employee empl
	JOIN Employee chief ON empl.chief_id = chief.id
WHERE empl.salary > chief.salary;