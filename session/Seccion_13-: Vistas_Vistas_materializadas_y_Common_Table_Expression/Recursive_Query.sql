SELECT * FROM employees;

WITH RECURSIVE bosses AS (
	-- Parte inicial: empezamos con el jefe base (id = 1)
	SELECT id, name, reports_to, 1 AS depth FROM employees WHERE id = 1
	
	UNION ALL
	
	-- Parte recursiva: buscamos a los empleados que reportan al jefe actual
	SELECT e.id, e.name, e.reports_to, b.depth + 1 FROM employees e
	INNER JOIN bosses b ON e.reports_to = b.id
	WHERE b.depth < 3

)
SELECT * FROM bosses;