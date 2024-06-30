-- https://sql-academy.org/ru/trainer/tasks/40

SELECT name as subjects
FROM Subject
JOIN Schedule
    ON Schedule.subject = Subject.id
JOIN Teacher
    ON Teacher.id = Schedule.teacher
WHERE 
    Teacher.last_name = 'Romashkin' AND 
    INSTR(Teacher.first_name, 'P') = 1 AND
    INSTR(Teacher.middle_name, 'P') = 1