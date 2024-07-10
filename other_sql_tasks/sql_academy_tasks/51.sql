-- https://sql-academy.org/ru/trainer/tasks/51

INSERT INTO Goods (good_id, good_name, type)
SELECT
    COUNT(*) + 1,
    'Cheese', 
    (
        SELECT good_type_id 
        FROM GoodTypes 
        WHERE good_type_name = 'food'
    )
FROM Goods;