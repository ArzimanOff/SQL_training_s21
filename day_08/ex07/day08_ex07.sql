----------------------------Session #1-----------------------------------
BEGIN;
-- BEGIN
----------------------------Session #2-----------------------------------
BEGIN;
-- BEGIN

----------------------------Session #1-----------------------------------
UPDATE pizzeria SET rating = 1 WHERE id = 1;
-- UPDATE 1

----------------------------Session #2-----------------------------------
UPDATE pizzeria SET rating = 2 WHERE id = 2;
-- UPDATE 1

----------------------------Session #1-----------------------------------
UPDATE pizzeria SET rating = 3 WHERE id = 2;
--UPDATE 1

----------------------------Session #2-----------------------------------
UPDATE pizzeria SET rating = 3 WHERE id = 1;
-- ������:  ���������� ����������������
-- DETAIL:  ������� 8820 ������� � ������ ShareLock ���������� "���������� 957"; ������������ ��������� 4760.
-- ������� 4760 ������� � ������ ShareLock ���������� "���������� 958"; ������������ ��������� 8820.
-- HINT:  ����������� ������� �������� � ��������� �������.
-- CONTEXT:  ��� ��������� ������� (0,12) � ��������� "pizzeria"

----------------------------Session #1-----------------------------------
COMMIT;
-- COMMIT

----------------------------Session #2-----------------------------------
COMMIT;
-- ROLLBACK