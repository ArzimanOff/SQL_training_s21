-- https://sql-academy.org/ru/trainer/tasks/19

SELECT DISTINCT status
FROM FamilyMembers
JOIN Payments
    ON Payments.family_member = FamilyMembers.member_id
JOIN Goods
    ON Goods.good_id = Payments.good AND Goods.good_name = 'potato'