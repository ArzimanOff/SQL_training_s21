WITH 
pepperoni AS (
    SELECT person_order.id,
        person_order.person_id,
        menu.pizzeria_id
    FROM person_order
        JOIN menu ON menu.pizza_name = 'pepperoni pizza'
),
cheese AS (
    SELECT person_order.id,
        person_order.person_id,
        menu.pizzeria_id
    FROM person_order
        JOIN menu ON menu.pizza_name = 'cheese pizza'
),
this AS (
    SELECT *
    FROM pepperoni
    INTERSECT
    SELECT *
    FROM cheese
)
	
SELECT DISTINCT name
FROM person
    JOIN this ON this.person_id = person.id
WHERE 
	gender = 'female'
    AND 
	person.id = this.person_id
ORDER BY name