-- https://sql-academy.org/ru/trainer/tasks/55

WITH 
-- кол-во полётов (минимальное)
min_trip_cnt AS (
    SELECT COUNT(*) as cnt 
    FROM Trip
    GROUP BY company
    ORDER BY cnt
    LIMIT 1
),
-- авиакомпании совершившие меньше всего полётов (их id) 
airlines_min_trips AS (
    SELECT 
        Trip.company as company_id
    FROM Trip
    GROUP BY Trip.company
    HAVING COUNT(*) = (SELECT cnt FROM min_trip_cnt)
)

DELETE FROM Company
WHERE id IN (SELECT company_id FROM airlines_min_trips);
