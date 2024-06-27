-- https://sql-academy.org/ru/trainer/tasks/25

-- ��������� ��� ���� ������� ���� ������ �� ����������,
-- ���� ���������� ����� �� ��� ������ 2005 ����
SELECT good_name
FROM Goods
LEFT JOIN Payments
    ON Payments.good = Goods.good_id
WHERE date IS NULL OR YEAR(date) <> 2005

EXCEPT 

-- ��������� ��� ���� ������� ���� �������� ���� 1 ��� � 2005 ����
SELECT DISTINCT good_name
FROM Goods
LEFT JOIN Payments
    ON Payments.good = Goods.good_id
WHERE YEAR(date) = 2005

-- EXCEPT - �� ������� ��������� ������� ��� �������� ������� ���� �� ������ ���������