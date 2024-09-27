-- https://sql-academy.org/ru/trainer/tasks/93

WITH a as(
    SELECT DISTINCT customer_key FROM Purchase 
    WHERE YEAR(date) = 2024 and product_key = (
        SELECT product_key FROM Product WHERE Product.name = "Smartwatch"
    )
)

SELECT AVG(age) as average_age FROM a
JOIN Customer On Customer.customer_key = a.customer_key
