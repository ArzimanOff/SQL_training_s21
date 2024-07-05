-- https://sql-academy.org/ru/trainer/tasks/47

SELECT COUNT(*) as count FROM Schedule
JOIN Teacher
    ON Teacher.id = Schedule.teacher AND Teacher.last_name = 'Krauze' AND Schedule.date = '2019-08-30'