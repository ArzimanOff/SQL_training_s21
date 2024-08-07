WITH 
orders AS (
    SELECT pizzeria.name,
        COUNT(pizzeria.id) AS count,
        'order' AS action_type
    FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
        JOIN person_order ON person_order.menu_id = menu.id
    GROUP BY pizzeria.name
    LIMIT 3
),
visits AS (
    SELECT pizzeria.name,
        COUNT(pizzeria.id) AS count,
        'visit' AS action_type
    FROM pizzeria
        JOIN person_visits ON pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    LIMIT 3
)

SELECT * FROM orders
UNION ALL
SELECT * FROM visits
ORDER BY action_type ASC, count DESC