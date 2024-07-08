-- https://sql-academy.org/ru/trainer/tasks/50

WITH 
all_student_cnt AS (
    SELECT COUNT(*) as cnt FROM Student
),
need_student_cnt AS (
    SELECT COUNT(*) as cnt FROM Student
    WHERE YEAR(birthday) = 2000
)


SELECT 
FLOOR((need_student_cnt.cnt * 100) / all_student_cnt.cnt)
as percent 
FROM need_student_cnt, all_student_cnt