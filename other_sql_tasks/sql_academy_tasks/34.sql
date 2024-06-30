-- https://sql-academy.org/ru/trainer/tasks/34

SELECT COUNT(*) as count
FROM Class
WHERE '10' = SUBSTRING(name, 1, INSTR(name, ' ')-1)