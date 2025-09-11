-- create function max_raise_2(id_employee);
CREATE OR REPLACE FUNCTION max_raise_2 (empl_id int) 
RETURNS NUMERIC(8, 2) AS $$
DECLARE
	selected_employee employees%rowtype;
	selected_job jobs%rowtype;

	possible_raise NUMERIC(8,2);

BEGIN
	--Tomar el puesto de trabajo y el salario
	SELECT * FROM employees INTO selected_employee
	WHERE employee_id = empl_id;

	--Tomar el max salary, acorde a su job
	SELECT * FROM jobs INTO selected_job
	WHERE job_id = selected_employee.job_id;

	--Cálculos
	possible_raise = selected_job.max_salary - selected_employee.salary;

	IF (possible_raise < 0) THEN RAISE EXCEPTION 'Persona con maximo salario: id:%, %', selected_employee.employee_id, selected_employee.first_name;
	
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