WITH cte_date AS (
    SELECT gs::date AS missing_date
    FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs
),
missing_dates AS (
    SELECT cte_date.missing_date
    FROM cte_date
    LEFT JOIN person_visits ON cte_date.missing_date = person_visits.visit_date 
        AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
    WHERE person_visits.visit_date IS NULL
)
SELECT missing_date
FROM missing_dates
ORDER BY missing_date;
