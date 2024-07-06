-- https://sql-academy.org/ru/trainer/tasks/49

WITH 
all_students AS (
    SELECT name, class, student
    FROM Student_in_class
    JOIN Class
        ON Class.id = Student_in_class.class
),
all_students_cnt AS (
    SELECT COUNT(*) as all_cnt FROM all_students
),
all_need_students_cnt AS (
    SELECT COUNT(*) as all_cnt FROM all_students WHERE name = '10 A'
)

SELECT 
    ROUND( (B.all_cnt * 100) / A.all_cnt, 4)
    AS percent
FROM all_students_cnt A, all_need_students_cnt B;