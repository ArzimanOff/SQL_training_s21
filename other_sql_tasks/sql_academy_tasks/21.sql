-- https://sql-academy.org/ru/trainer/tasks/21

SELECT good_name
FROM Goods
JOIN Payments
    ON Payments.good = Goods.good_id
GROUP BY good_name
HAVING COUNT(good_name) > 1