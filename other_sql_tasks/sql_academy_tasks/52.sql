-- https://sql-academy.org/ru/trainer/tasks/52

INSERT INTO GoodTypes (good_type_id, good_type_name)
SELECT 
    COUNT(*) + 1,
    'auto'
FROM GoodTypes