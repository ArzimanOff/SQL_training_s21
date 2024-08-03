WITH 
visits_cnt AS (
    SELECT person.name,
        COUNT(person_visits.id) AS count_of_visits
    FROM person_visits
        JOIN person ON person_id = person.id
    GROUP BY person.name
    ORDER BY count_of_visits DESC,
        person.name ASC
)
SELECT 
    visits_cnt.name, 
    visits_cnt.count_of_visits
FROM visits_cnt
WHERE visits_cnt.count_of_visits > 3