SELECT name AS object_name
FROM (
    SELECT name
    FROM person
    ORDER BY name
  ) AS object_person_name
UNION ALL
SELECT pizza_name AS object_name
FROM (
    SELECT pizza_name
    FROM menu
    ORDER BY menu.pizza_name
  ) AS object_pizza_name