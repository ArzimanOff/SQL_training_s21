SELECT DISTINCT person_id /*DISTINCT для того чтобы строки в табличке результатов не повторялись*/
FROM person_visits
WHERE (visit_date BETWEEN '2022-01-06' AND '2022-01-09') OR (pizzeria_id = 2)
ORDER BY person_id DESC /*DESC (сокращение от descending – нисходящий) для сортировке в порядке убывания*/