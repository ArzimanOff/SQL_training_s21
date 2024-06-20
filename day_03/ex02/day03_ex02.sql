WITH isNotOrder AS (
    SELECT
        id as menu_id
    FROM
        menu
    WHERE
        NOT EXISTS (
            SELECT
                person_order.menu_id
            FROM
                person_order
            WHERE
                person_order.menu_id = menu.id
            )
    ORDER BY menu_id
)

SELECT
    menu.pizza_name,
    menu.price,
    pizzeria.name
FROM
    isNotOrder
    JOIN menu ON isNotOrder.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY menu.pizza_name, menu.price;
