INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    generate_series(
        (SELECT MAX(person_order.id) FROM person_order) + 1,
        (SELECT MAX(person.id) FROM person) + (SELECT MAX(person_order.id) FROM person_order),
        1
        ),
    generate_series(
        (SELECT MIN(person.id) FROM person), (SELECT MAX(person.id) FROM person)
        ),
    (SELECT menu.id FROM menu WHERE menu.pizza_name = 'greek pizza'),
    '2022-02-25';