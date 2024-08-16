--  Создание таблицы аудита person_audit (создается если еще не существует)
CREATE TABLE IF NOT EXISTS person_audit
(
    created timestamp with time zone not null default current_timestamp,
    -- столбец created сохраняет время, когда запись была добавлена в таблицу

    type_event char(1) not null default 'I' CONSTRAINT ch_type_event check(type_event in ('I','D','U')),
    -- столбец type_event фиксирует тип события: 'I' для INSERT, 'D' для DELETE, 'U' для UPDATE

    row_id bigint not null,
    -- сохраняет идентификатор строки из основной таблицы (person), где произошло изменение


    name varchar,
    age        integer,
    gender     varchar,
    address    varchar
    -- остальные столбцы для хранения данных из измененной строки в таблице person
);

-- Создание функции триггера fnc_trg_person_insert_audit
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO person_audit (row_id, name, age, gender, address)
        VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    after insert
    on person
    for each row
    execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

-- SELECT * FROM person;
-- SELECT * FROM person_audit;