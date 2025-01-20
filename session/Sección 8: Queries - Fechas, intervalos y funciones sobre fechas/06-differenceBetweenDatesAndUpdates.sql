SELECT 
    hire_date,
    (DATE '2026-01-01' - hire_date) AS days_until_2026,
    MAKE_INTERVAL(
        DAYS := (DATE '2026-01-01' - hire_date)
    ) AS time_until_2026
FROM 
    employees
ORDER BY 
    hire_date DESC;


WITH
	tenure_calculation AS (
		SELECT
			employee_id,
			hire_date + MAKE_INTERVAL(
				YEARS := EXTRACT(
					YEAR
					FROM
						CURRENT_DATE
				)::INTEGER - EXTRACT(
					YEAR
					FROM
						hire_date
				)::INTEGER
			) AS updated_hire_date
		FROM
			employees
	)
UPDATE employees e
SET
	hire_date = t.updated_hire_date
FROM
	tenure_calculation t
WHERE
	e.employee_id = t.employee_id;