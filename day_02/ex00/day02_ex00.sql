SELECT DISTINCT pizzeria.name, pizzeria.rating
FROM pizzeria
LEFT JOIN person_visits ON pizzeria.id = pizzeria_id
WHERE person_id IS NULL