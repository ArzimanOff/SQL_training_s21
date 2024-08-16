CREATE FUNCTION func_minimum(VARIADIC arr numeric[]) 
RETURNS numeric 
AS $$
    SELECT MIN(arr[i])
    FROM GENERATE_SUBSCRIPTS(arr, 1) indices(i);
$$ LANGUAGE SQL;

SELECT func_minimum(VARIADIC arr => ARRAY [0, 1, 2, -5, 3, 4]);