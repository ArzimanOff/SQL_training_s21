-- https://sql-academy.org/ru/trainer/tasks/26

-- стоит обратить внимание на то, что если у не купленной вещи тип A, 
-- то может быть другая вещь типа A, которая была купленна

-- определяем множество в котором указаны названия вещей не купленных в 2005 и их тип
WITH not_buyed_in_2005 AS (
    SELECT good_name, type
    FROM Goods
    	LEFT JOIN Payments ON Payments.good = Goods.good_id
    WHERE date IS NULL
    	OR YEAR(date) <> 2005

    EXCEPT

    SELECT DISTINCT good_name, type
    FROM Goods
    	LEFT JOIN Payments ON Payments.good = Goods.good_id
    WHERE YEAR(date) = 2005
)



SELECT good_type_name FROM not_buyed_in_2005
JOIN GoodTypes
    ON GoodTypes.good_type_id = not_buyed_in_2005.type
GROUP BY good_type_name

EXCEPT 

SELECT DISTINCT good_type_name
FROM GoodTypes
JOIN Goods ON Goods.type = GoodTypes.good_type_id
JOIN Payments ON Payments.good = Goods.good_id
WHERE YEAR(date) = 2005