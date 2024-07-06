 -- https://sql-academy.org/ru/trainer/tasks/48

SELECT name, COUNT(*) as count 
FROM Student_in_class
JOIN Class
    ON Class.id = Student_in_class.class
GROUP BY name
ORDER BY count DESC