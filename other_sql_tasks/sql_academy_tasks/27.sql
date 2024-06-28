-- https://sql-academy.org/ru/trainer/tasks/27

SELECT good_type_name, SUM(Payments.amount * Payments.unit_price) as costs
FROM GoodTypes
JOIN Goods ON Goods.type = GoodTypes.good_type_id
JOIN Payments ON Payments.good = Goods.good_id AND YEAR(Payments.date) = 2005
GROUP BY good_type_name