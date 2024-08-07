-- https://sql-academy.org/ru/trainer/tasks/62

WITH all_domains as(
SELECT SUBSTRING(email FROM POSITION('@' IN email) + 1) AS domain
FROM Users
)

SELECT domain, COUNT(*) as count
FROM all_domains
GROUP BY domain
ORDER BY count DESC, domain;