-- https://sql-academy.org/ru/trainer/tasks/33

SELECT AVG(unit_price) as cost
FROM Payments
JOIN Goods ON Goods.good_id = Payments.good AND (good_name = 'red caviar' OR good_name = 'black caviar')
GROUP BY type