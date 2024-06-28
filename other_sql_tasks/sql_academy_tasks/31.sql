-- https://sql-academy.org/ru/trainer/tasks/31

SELECT * 
FROM FamilyMembers
WHERE 'Quincey' = SUBSTRING(member_name, INSTR(member_name, ' ') + 1)