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
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
-- INSERT 0 1

COMMIT WORK;
--COMMIT

----------------------------Session #1-----------------------------------
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  25.9
-- (1 row)

COMMIT WORK;
-- COMMIT

SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  25.9
-- (1 row)

----------------------------Session #2-----------------------------------
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  25.9
-- (1 row)
