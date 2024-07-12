-- https://sql-academy.org/ru/trainer/tasks/57

UPDATE Timepair
SET 
    start_pair = start_pair + INTERVAL '30' minute,
    end_pair = end_pair + INTERVAL '30' minute 