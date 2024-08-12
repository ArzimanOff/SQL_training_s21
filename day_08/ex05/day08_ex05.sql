----------------------------Session #1-----------------------------------
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- BEGIN

----------------------------Session #2-----------------------------------
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- BEGIN

----------------------------Session #1-----------------------------------
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  21.9
-- (1 row)

----------------------------Session #2-----------------------------------
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);
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
-- COMMIT

SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  26.9
-- (1 row)

----------------------------Session #2-----------------------------------
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  26.9
-- (1 row)
