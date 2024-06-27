-- https://sql-academy.org/ru/trainer/tasks/11

SELECT name
FROM Passenger
WHERE LENGTH(name) = (
		SELECT LENGTH(name) as name_len
		FROM Passenger
		ORDER BY name_len DESC
		LIMIT 1
	)