-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH 
-- сохраняем уникальные id и названия валют
unique_currency AS (
	SELECT id, name 
	FROM currency 
	GROUP BY id, name
),
-- содержит данные о пользователе, название валюты, сумму денег (balance.money), 
-- и ближайший курс валюты относительно даты обновления баланса
nearest_rate AS (
	SELECT 
        u.name AS name,
        u.lastname AS lastname,
        uni_c.name AS currency_name,
        balance.money,
        COALESCE(
            (
                SELECT rate_to_usd
                FROM currency
                WHERE currency_id = currency.id AND currency.updated < balance.updated 
                ORDER BY currency.updated DESC 
                LIMIT 1
            ), 
            (
                SELECT rate_to_usd
                FROM currency
                WHERE currency_id = currency.id AND currency.updated > balance.updated 
                ORDER BY currency.updated ASC 
                LIMIT 1
            )
        ) AS rate_to_usd
    FROM balance
    -- Это соединение добавляет к каждой записи из balance название валюты (currency_name)
    INNER JOIN unique_currency AS uni_c ON uni_c.id = currency_id 
    -- Добавляет информацию о пользователе (имя name и фамилия lastname) к каждой записи в balance
    LEFT JOIN "user" u ON u.id = user_id
) 
SELECT 
    COALESCE(name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname, 
    currency_name,  
    money * rate_to_usd AS currency_in_usd
FROM nearest_rate
ORDER BY name DESC, lastname, currency_name;
