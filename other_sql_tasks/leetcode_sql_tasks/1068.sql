-- https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50

SELECT 
    product_name,
    year,
    price
FROM Sales
JOIN Product
ON Sales.product_id = Product.product_id