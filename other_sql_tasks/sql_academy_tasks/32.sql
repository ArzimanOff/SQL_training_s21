-- https://sql-academy.org/ru/trainer/tasks/32

SELECT 
    -- округляем вниз к целому числу
    FLOOR(
        -- находим среднее арифметическое всех возрастов
        AVG(
            TIMESTAMPDIFF(YEAR, birthday, NOW()) -- находим разницу между датой роэжения и текущей датой для каждого человека
        )
    ) as age 
FROM FamilyMembers