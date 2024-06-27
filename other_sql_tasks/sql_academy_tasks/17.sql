-- https://sql-academy.org/ru/trainer/tasks/17

SELECT 
    member_name,
    status,
    SUM(amount * unit_price) as costs
FROM Payments
JOIN FamilyMembers 
    ON FamilyMembers.member_id = Payments.family_member
WHERE YEAR(date) = 2005
GROUP BY member_name, status