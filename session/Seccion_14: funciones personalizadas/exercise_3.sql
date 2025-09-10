-- Resolve with function
-- create function max_raise(id_employee);
CREATE OR REPLACE FUNCTION max_raise (empl_id int) 
RETURNS NUMERIC(8, 2) AS $$
DECLARE
	possible_raise NUMERIC(8,2);
BEGIN

	SELECT
		max_salary - salary INTO STRICT possible_raise
	FROM
		employees
		INNER JOIN jobs ON jobs.job_id = employees.job_id
		WHERE employee_id = empl_id;
	
	RETURN possible_raise;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE EXCEPTION 'No existe empleado con id %', empl_id;
    WHEN TOO_MANY_ROWS THEN
        RAISE EXCEPTION 'Se encontró más de un empleado con id %', empl_id;
END;
$$ LANGUAGE plpgsql



SELECT max_raise(2);