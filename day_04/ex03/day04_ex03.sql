SELECT
    v_generated_dates.generated_date as missing_date
FROM
    v_generated_dates
EXCEPT
SELECT
    person_visits.visit_date
FROM
    person_visits
WHERE
    person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-31'
ORDER BY missing_date
