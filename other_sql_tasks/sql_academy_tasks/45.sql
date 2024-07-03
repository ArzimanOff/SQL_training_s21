-- https://sql-academy.org/ru/trainer/tasks/45

SELECT classroom FROM Schedule
GROUP BY classroom
HAVING COUNT(classroom) = (
    SELECT COUNT(classroom) as count FROM Schedule
    GROUP BY classroom
    ORDER BY count DESC
    LIMIT 1
)
