-- https://sql-academy.org/ru/trainer/tasks/25

-- выбериема все вещи которые либо вообще не заказывали,
-- либо заказывали когда то ещё помимо 2005 года
SELECT good_name
FROM Goods
LEFT JOIN Payments
    ON Payments.good = Goods.good_id
WHERE date IS NULL OR YEAR(date) <> 2005

EXCEPT 

-- выбериема все вещи которые были заказаны хоть 1 раз в 2005 году
SELECT DISTINCT good_name
FROM Goods
LEFT JOIN Payments
    ON Payments.good = Goods.good_id
WHERE YEAR(date) = 2005

-- EXCEPT - из первого множества удаляем все элементы которые есть во втором множестве