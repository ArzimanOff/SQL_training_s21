CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',
                                                              pprice numeric default 500,
                                                              pdate date default '2022-01-08')
RETURNS TABLE (name varchar)
AS $$
    SELECT pizzeria.name
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id

    WHERE 
        person.name = pperson
        AND 
        pprice > menu.price
        AND 
        person_visits.visit_date=pdate;
$$ LANGUAGE SQL;

SELECT * 
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');