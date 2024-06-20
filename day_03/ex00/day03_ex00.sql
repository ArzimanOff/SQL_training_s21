SELECT
  menu.pizza_name AS pizza_name,
  menu.price AS price,
  pizzeria.name AS pizzeria_name,
  person_visits.visit_date AS visti_date
FROM
  menu
  JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
  JOIN person ON person.id = person_visits.person_id AND person.name = 'Kate'
WHERE
  menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;