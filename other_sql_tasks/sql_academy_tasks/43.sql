-- https://sql-academy.org/ru/trainer/tasks/43

SELECT last_name FROM Teacher
JOIN Schedule
    ON Schedule.teacher = Teacher.id
JOIN Subject
    ON Subject.id = Schedule.subject AND Subject.name = 'Physical Culture'
ORDER BY last_name