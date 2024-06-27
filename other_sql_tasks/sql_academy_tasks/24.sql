-- https://sql-academy.org/ru/trainer/tasks/24

SELECT 
    member_name,
    SUM(unit_price * amount) as costs
FROM FamilyMembers
JOIN Payments
    ON Payments.family_member = FamilyMembers.member_id 
    AND YEAR(Payments.date) = 2005
    AND MONTH(Payments.date) = 06
GROUP BY member_name