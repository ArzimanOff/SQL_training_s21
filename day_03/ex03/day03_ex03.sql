WITH 

-- табличка с названиями пиццерий куда приходили мужчины
male as (
    SELECT
        pizzeria.name
    FROM
        person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        JOIN person ON person_visits.person_id = person.id
    WHERE
        person.gender = 'male'
    ),

-- табличка с названиями пиццерий куда приходили женщины
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

-- табличка с названиями пиццерий куда приходили ТОЛЬКО мужчины
male_only as (
    SELECT * FROM
        male
    EXCEPT ALL
    SELECT * FROM
        female
    ),

-- табличка с названиями пиццерий куда приходили ТОЛЬКО женщины
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
