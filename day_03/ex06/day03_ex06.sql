WITH tempMenu as (
    SELECT
        menu.id,
        menu.pizza_name,
        pizzeria.name,
        pizzeria.id as pz_id,
        menu.price
    FROM
        menu
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT
    menu1.pizza_name,
    menu1.name as pizzeria_name_1,
    menu2.name as pizzeria_name_2,
    menu1.price
FROM
    tempMenu menu1
    LEFT JOIN tempMenu menu2 ON menu1.pizza_name = menu2.pizza_name AND menu1.price = menu2.price AND menu1.name != menu2.name
WHERE
    menu2.name IS NOT NULL AND menu1.pz_id > menu2.pz_id
ORDER BY menu1.pizza_name;
