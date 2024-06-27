-- https://sql-academy.org/ru/trainer/tasks/18

SELECT member_name 
FROM FamilyMembers
WHERE birthday = (
    SELECT birthday
    FROM FamilyMembers
    ORDER BY birthday
    LIMIT 1
    )