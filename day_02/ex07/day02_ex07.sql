SELECT 
	DISTINCT pizzeria.name AS pizzeria_name
FROM
	menu,
	pizzeria,
	person_visits,
	
	(	
		SELECT id AS this_id
		FROM person
		WHERE person.name = 'Dmitriy'
	) AS id_of_need_person
WHERE 
	id_of_need_person.this_id = person_id
	AND
	visit_date = '2022-01-08'
	AND
	person_visits.pizzeria_id = pizzeria.id
	AND
	menu.price < 800