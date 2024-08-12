----------------------------Session #1-----------------------------------
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- BEGIN

----------------------------Session #2-----------------------------------
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- BEGIN

----------------------------Session #1-----------------------------------
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  26.9
-- (1 row)

----------------------------Session #2-----------------------------------
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
-- INSERT 0 1

COMMIT WORK;
--COMMIT

----------------------------Session #1-----------------------------------
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  26.9
-- (1 row)

COMMIT WORK;
--COMMIT

SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  30.9
-- (1 row)

----------------------------Session #1-----------------------------------


SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  30.9
-- (1 row)