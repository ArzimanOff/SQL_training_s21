SELECT 
    person.name, 
    menu.pizza_name, 
    menu.price,
    CAST(
        menu.price * (1 - person_discounts.discount / 100)
        as numeric(18, 0)
    ) AS new_price,
    pizzeria.name AS pizzeria_name
FROM person_order
    JOIN person
        ON person.id = person_order.person_id
    JOIN menu
        ON menu.id = person_order.menu_id
    JOIN pizzeria
        ON pizzeria.id = menu.pizzeria_id
    JOIN person_discounts
        ON 
        person.id = person_discounts.person_id 
        AND 
        pizzeria.id = person_discounts.pizzeria_id
ORDER BY person.name, menu.pizza_name;
