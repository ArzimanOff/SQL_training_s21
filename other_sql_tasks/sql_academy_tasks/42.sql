-- https://sql-academy.org/ru/trainer/tasks/42

WITH 
start_time AS (
    SELECT start_pair FROM Timepair
    WHERE id = 2
),
end_time AS (
    SELECT end_pair FROM Timepair
    WHERE id = 4
)

SELECT TIMEDIFF(end_pair, start_pair) as time FROM start_time, end_time

-- -- второй варианте
-- SELECT TIMEDIFF(
--     (SELECT end_pair FROM Timepair WHERE id = 4),
--     (SELECT start_pair FROM Timepair WHERE id = 2)
-- ) AS time;
