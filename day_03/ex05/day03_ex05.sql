WITH visit as (
        SELECT
            pizzeria.name as name
        FROM
            pizzeria
            JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
            JOIN person ON person_visits.person_id = person.id
        WHERE
            person.name = 'Andrey'
    ),
    orders as (
        SELECT
            pizzeria.name as name
        FROM
            pizzeria
            JOIN menu ON pizzeria.id = menu.pizzeria_id
            JOIN person_order ON menu.id = person_order.menu_id
            JOIN person ON person_order.person_id = person.id
        WHERE
            person.name = 'Andrey'
    )
SELECT * FROM
    visit
EXCEPT
SELECT * FROM
    orders
ORDER BY name;
