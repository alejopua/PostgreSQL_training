-- create function max_raise_2(id_employee);
CREATE OR REPLACE FUNCTION max_raise_2 (empl_id int) 
RETURNS NUMERIC(8, 2) AS $$
DECLARE
	employee_job_id int;
	current_salary NUMERIC(8,2);

	job_max_salary NUMERIC(8,2);
	possible_raise NUMERIC(8,2);

BEGIN
	--Tomar el puesto de trabajo y el salario
	SELECT
		job_id, salary
		INTO employee_job_id, current_salary
	FROM
		employees
	WHERE
		employee_id = empl_id;

	--Tomar el max salary, acorde a su job
	SELECT
		max_salary INTO job_max_salary
	FROM
		jobs
		WHERE job_id = employee_job_id;
	--Cálculos
	possible_raise = job_max_salary - current_salary;

	IF (possible_raise < 0) THEN possible_raise = 0;
	
	END IF;
	
	RETURN possible_raise;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE EXCEPTION 'No existe empleado con id %', empl_id;
    WHEN TOO_MANY_ROWS THEN
        RAISE EXCEPTION 'Se encontró más de un empleado con id %', empl_id;
END;
$$ LANGUAGE plpgsql



SELECT
	employee_id,
	first_name,
	salary,
	max_salary,
	max_raise (employee_id),
	max_raise_2 (employee_id)
FROM
	employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id
WHERE
	employee_id = 206;