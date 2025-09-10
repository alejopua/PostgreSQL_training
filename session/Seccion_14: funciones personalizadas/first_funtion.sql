SELECT greet_employee('Alejo');

SELECT first_name, greet_employee(first_name) FROM employees;

CREATE OR REPLACE FUNCTION greet_employee (employee_name VARCHAR)
RETURNS VARCHAR
as $$
--DECLARE
BEGIN

RETURN 'Hello ' || employee_name;

END;

$$
LANGUAGE plpgsql;

-- https://www.postgresql.org/docs/current/sql-createfunction.html