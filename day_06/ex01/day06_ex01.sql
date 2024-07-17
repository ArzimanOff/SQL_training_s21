WITH 
orders_count AS (
    SELECT person_order.person_id, menu.pizzeria_id, COUNT(*) AS count
    FROM person_order
    JOIN menu 
        ON menu.id = person_order.menu_id
    GROUP BY person_order.person_id, menu.pizzeria_id
)

INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER (), 
    orders_count.person_id, 
    orders_count.pizzeria_id,
    CASE 
        WHEN orders_count.count = 1 THEN 10.5
        WHEN orders_count.count = 2 THEN 22
        ELSE 30 
    END
FROM orders_count;