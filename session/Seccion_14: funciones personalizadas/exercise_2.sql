SELECT
	employee_id,
	first_name,
	salary,
	max_salary,
	max_salary - salary AS possible_raise
FROM
	employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id;