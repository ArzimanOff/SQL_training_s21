-- DROP FUNCTION IF EXISTS fnc_persons_male();
-- DROP FUNCTION IF EXISTS fnc_persons_female();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender VARCHAR DEFAULT 'female')
    RETURNS TABLE
            (
                person_id bigint,
                name      varchar,
                age       integer,
                gender    varchar,
                address   varchar
            )
AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = pgender;
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons(pgender := 'male');
SELECT * FROM fnc_persons();