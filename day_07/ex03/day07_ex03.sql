WITH 
orders AS (
    SELECT 
        pizzeria.name,
        COUNT(pizzeria.id) AS total_count
    FROM pizzeria
    JOIN menu 
        ON menu.pizzeria_id = pizzeria.id
    JOIN person_order 
        ON person_order.menu_id = menu.id
    GROUP BY pizzeria.name
),
visits AS (
    SELECT 
        pizzeria.name,
        COUNT(pizzeria.id) AS total_count
    FROM pizzeria
    JOIN person_visits 
        ON pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
),
result AS (
    SELECT * FROM orders
    UNION ALL
    SELECT * FROM visits
)
SELECT 
    result.name,
    SUM(total_count) AS total_count
FROM result
GROUP BY result.name
ORDER BY 2 DESC, 1 ASC