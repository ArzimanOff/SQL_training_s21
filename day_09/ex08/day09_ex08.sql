CREATE OR REPLACE FUNCTION  fnc_fibonacci (IN pstop integer DEFAULT 10)
RETURNS setof INTEGER
AS $$
    WITH RECURSIVE fib(a,b) 
    AS (
        VALUES(0,1)
        UNION ALL
        SELECT greatest(a,b),
                a+b as fib_ser
        FROM fib
        WHERE b<pstop
        )
    SELECT a
    FROM fib;
$$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();