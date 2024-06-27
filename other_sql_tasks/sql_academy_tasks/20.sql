-- https://sql-academy.org/ru/trainer/tasks/20

SELECT 
    status,
    member_name,
    SUM(amount * unit_price) as costs
FROM FamilyMembers
JOIN Payments
    ON Payments.family_member = FamilyMembers.member_id
JOIN Goods
    ON Goods.good_id = Payments.good
JOIN GoodTypes
    ON GoodTypes.good_type_id = Goods.type AND GoodTypes.good_type_name = 'entertainment'
GROUP BY status, member_name