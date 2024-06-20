WITH male as (
    SELECT
        pizzeria.name
    FROM
        person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        JOIN person ON person_visits.person_id = person.id
    WHERE
        person.gender = 'male'
    ),
    female as (
    SELECT
        pizzeria.name
    FROM
        person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        JOIN person ON person_visits.person_id = person.id
    WHERE
        person.gender = 'female'
    ),
    male_only as (
    SELECT * FROM
        male
    EXCEPT ALL
    SELECT * FROM
        female
    ),
    female_only as (
    SELECT * FROM
        female
    EXCEPT ALL
    SELECT
        *
    FROM
        male
    )
SELECT * FROM
    male_only
UNION ALL
    SELECT * FROM
        female_only
ORDER BY
    name;
