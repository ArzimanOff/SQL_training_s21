SELECT 
    CONCAT(name, ' (age:', age, ',gender:''', gender, ''',address:''', address, ''')') AS person_information
FROM 
    person
ORDER BY 
    person_information ASC;

/*
CONCAT -  Объединяет две или более строки в одну строку.
CONCAT_WS - Объединяет строки с разделителем который передается в качестве первого аргумента

ASC - используется сортировки в порядке возрастания
*/