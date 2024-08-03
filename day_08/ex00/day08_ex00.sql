----------------------------Session #1-----------------------------------
begin;
-- BEGIN

----------------------------Session #2-----------------------------------
begin;
-- BEGIN

----------------------------Session #1-----------------------------------
select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    4.6
-- (1 row)

update pizzeria set rating = 5 where name = 'Pizza Hut';
-- UPDATE 1

select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)

----------------------------Session #2-----------------------------------
select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    4.6
-- (1 row)

----------------------------Session #1-----------------------------------
commit;
-- COMMIT

----------------------------Session #2-----------------------------------
select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)