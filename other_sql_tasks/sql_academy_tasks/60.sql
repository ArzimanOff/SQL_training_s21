-- https://sql-academy.org/ru/trainer/tasks/60


WITH 
need_classes_ids AS (
    SELECT id FROM Class WHERE name LIKE "11%"
)

SELECT teacher
FROM Schedule
INNER JOIN need_classes_ids 
    ON Schedule.class = need_classes_ids.id
GROUP BY teacher
HAVING 
    COUNT(DISTINCT Schedule.class) = (SELECT COUNT(*) FROM need_classes_ids)
