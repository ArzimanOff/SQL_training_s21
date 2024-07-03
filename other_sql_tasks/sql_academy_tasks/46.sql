-- https://sql-academy.org/ru/trainer/tasks/46

SELECT DISTINCT name FROM Class
JOIN Schedule
    ON Schedule.class = Class.id
JOIN Teacher
    ON Teacher.id = Schedule.teacher AND Teacher.last_name = 'Krauze'