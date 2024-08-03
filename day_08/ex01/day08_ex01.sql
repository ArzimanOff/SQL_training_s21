----------------------------Session #1-----------------------------------
begin;
-- BEGIN

----------------------------Session #2-----------------------------------
begin;
--BEGIN

----------------------------Session #1-----------------------------------
select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)


----------------------------Session #2-----------------------------------
select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)

----------------------------Session #1-----------------------------------
update pizzeria set rating = 4 where name = 'Pizza Hut';
-- UPDATE 1
----------------------------Session #2-----------------------------------
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
-- UPDATE 1

----------------------------Session #1-----------------------------------
commit work;
-- COMMIT
----------------------------Session #2-----------------------------------
commit work;
-- COMMIT

----------------------------Session #1-----------------------------------
select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

----------------------------Session #2-----------------------------------
select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)