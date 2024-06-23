WITH notOrderPizza AS (
	SELECT id FROM menu
	EXCEPT
	SELECT DISTINCT menu_id FROM person_order
)

SELECT 
	pizza_name,
	price,
	pizzeria.name AS pizzeria_name
FROM 
	notOrderPizza
	JOIN menu ON notOrderPizza.id = menu.id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, price

