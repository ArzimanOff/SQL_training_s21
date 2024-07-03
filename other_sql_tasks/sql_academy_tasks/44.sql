-- https://sql-academy.org/ru/trainer/tasks/44

SELECT TIMESTAMPDIFF(YEAR, birthday, NOW()) AS max_year FROM Student
JOIN Student_in_class
    ON Student_in_class.student = Student.id
JOIN Class
    ON Class.id = Student_in_class.class AND Class.name LIKE '10%'
ORDER BY max_year DESC
LIMIT 1