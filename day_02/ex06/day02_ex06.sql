SELECT 
	pizza_name,
	pizzeria.name AS pizzeria_name
FROM
	menu,
	pizzeria,
	person_order, 

	(	
		SELECT id AS this_id
		FROM person
		WHERE person.name = 'Anna' OR person.name = 'Denis'
	) AS id_of_need_person
	 -- СЃРѕС…СЂР°РЅСЏРµРј РІ С‚Р°Р±Р»РёС†Сѓ id_of_need_person РѕРґРёРЅ СЃС‚РѕР»Р±РµС† this_id 
	 -- РІ РєРѕС‚РѕСЂРѕРј РїРµСЂРµС‡РёСЃР»СЏСЋС‚СЃСЏ id РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№ 'Anna' Рё 'Denis'
	
WHERE 
	id_of_need_person.this_id = person_order.person_id
	AND 
	menu_id = menu.id
	AND 
	pizzeria_id = pizzeria.id
ORDER BY 
	pizza_name,
	pizzeria_name;
