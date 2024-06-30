-- https://sql-academy.org/ru/trainer/tasks/39

SELECT COUNT(*) as count FROM Class
JOIN Student_in_class
    ON Student_in_class.class = Class.id
WHERE name = '10 B'