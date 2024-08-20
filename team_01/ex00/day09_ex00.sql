WITH last_rate(id, name, last_rate_to_usd) AS
(
	SELECT DISTINCT
		c1.id,
		c1.name,
		(
		 SELECT c2.rate_to_usd FROM "currency" c2
		 WHERE c2.updated = 
			(SELECT MAX(updated) FROM currency) -- последняя дата обновления курса валюты
		 AND c2.id = c1.id
		) -- выбираем самый актуальный курс валюты к доллару
	FROM "currency" c1
) -- идентификатор, имя и последний курс к доллару для каждой валюты

SELECT 
	COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	b.type,
	SUM(b.money) AS volume,
	COALESCE(lr.name, 'not defined') AS currency_name,
	COALESCE(lr.last_rate_to_usd, 1) AS last_rate_to_usd,
	(SUM(b.money) * COALESCE(lr.last_rate_to_usd, 1)) AS total_volume_in_usd
FROM "balance" b
FULL JOIN "user" u ON u.id = b.user_id
LEFT JOIN "last_rate" lr ON lr.id = b.currency_id
GROUP BY b.type, u.id, lr.name, lr.last_rate_to_usd
ORDER BY name DESC, lastname, type

-- COALESCE(u.name, 'not defined') для замены null на not defined
