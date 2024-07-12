-- https://sql-academy.org/ru/trainer/tasks/58

WITH 
need_reservation AS (
    SELECT Reservations.id as id FROM Reviews
    RIGHT JOIN Reservations
        ON Reservations.id = Reviews.reservation_id 
    JOIN Rooms
        ON Rooms.id = Reservations.room_id
    JOIN Users 
        ON Users.id = Reservations.user_id
    WHERE reservation_id IS NULL AND Users.name = 'George Clooney'
)

INSERT INTO Reviews
VALUES (
    (SELECT COUNT(*) + 1 FROM Reviews),
    (SELECT id FROM need_reservation), 
    5
);
