-- https://sql-academy.org/ru/trainer/tasks/32

SELECT 
    -- ��������� ���� � ������ �����
    FLOOR(
        -- ������� ������� �������������� ���� ���������
        AVG(
            TIMESTAMPDIFF(YEAR, birthday, NOW()) -- ������� ������� ����� ����� �������� � ������� ����� ��� ������� ��������
        )
    ) as age 
FROM FamilyMembers