-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH 
-- ��������� ���������� id � �������� �����
unique_currency AS (
	SELECT id, name 
	FROM currency 
	GROUP BY id, name
),
-- �������� ������ � ������������, �������� ������, ����� ����� (balance.money), 
-- � ��������� ���� ������ ������������ ���� ���������� �������
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
    -- ��� ���������� ��������� � ������ ������ �� balance �������� ������ (currency_name)
    INNER JOIN unique_currency AS uni_c ON uni_c.id = currency_id 
    -- ��������� ���������� � ������������ (��� name � ������� lastname) � ������ ������ � balance
    LEFT JOIN "user" u ON u.id = user_id
) 
SELECT 
    COALESCE(name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname, 
    currency_name,  
    money * rate_to_usd AS currency_in_usd
FROM nearest_rate
ORDER BY name DESC, lastname, currency_name;
