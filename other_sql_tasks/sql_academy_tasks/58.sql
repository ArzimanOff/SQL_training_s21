-- https://sql-academy.org/ru/trainer/tasks/58


INSERT INTO Reviews
VALUES (
    (SELECT COUNT(*) + 1 FROM Reviews as rw), 
    -- ��� 'as rw' �� ��������, ��� ��� ������ ������� ���-�� ����� � ������� 
    -- � ������������ � ��� ������� ���-�� ���������
    (
        SELECT Reservations.id FROM  Reservations
        JOIN Rooms
            ON Rooms.id = Reservations.room_id
        JOIN Users 
            ON Users.id = Reservations.user_id
        WHERE address = '11218, Friel Place, New York' 
        AND name = 'George Clooney'
    ), 
    5
);