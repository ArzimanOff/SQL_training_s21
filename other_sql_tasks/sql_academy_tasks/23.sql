-- https://sql-academy.org/ru/trainer/tasks/23

SELECT
    Goods.good_name,
    unit_price
FROM Payments
JOIN Goods
    ON Goods.good_id = Payments.good
JOIN GoodTypes
    ON GoodTypes.good_type_id = Goods.type
    AND GoodTypes.good_type_name = 'delicacies'
LIMIT 1