SELECT 
	pizza_name,
	pizzeria.name AS pizzeria_name
FROM
	menu,
	pizzeria,
	person_order, 

	(	
		SELECT id AS this_id
		FROM person
		WHERE person.name = 'Anna' OR person.name = 'Denis'
	) AS id_of_need_person
	 -- сохраняем в таблицу id_of_need_person один столбец this_id 
	 -- в котором перечисляются id пользователей 'Anna' и 'Denis'
	
WHERE 
	id_of_need_person.this_id = person_order.person_id
	AND 
	menu_id = menu.id
	AND 
	pizzeria_id = pizzeria.id
ORDER BY 
	pizza_name,
	pizzeria_name;
