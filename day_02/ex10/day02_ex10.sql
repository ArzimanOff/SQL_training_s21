SELECT 
	table_1.name as person_name1,
	table_2.name as person_name2,
	table_1.address as common_address
FROM
	person table_1,
	person table_2
WHERE
	table_1.address = table_2.address
	AND
	table_1.id > table_2.id
ORDER BY 1, 2, 3
	