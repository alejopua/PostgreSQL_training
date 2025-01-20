SELECT
	*
FROM
	employees
WHERE
	hire_date > date ('1998-02-05')
ORDER BY
	hire_date ASC;

SELECT
	min(hire_date) as firstEmployee,
	max(hire_date) as newEmployee
FROM
	employees;

SELECT
	*
FROM
	employees
WHERE
	hire_date BETWEEN DATE ('1998-02-05') AND DATE  ('2000-02-05');
