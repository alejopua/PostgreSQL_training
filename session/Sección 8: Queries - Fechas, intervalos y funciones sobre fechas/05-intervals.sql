WITH latest_hire AS (
    SELECT max(hire_date) AS date
    FROM employees
)
SELECT 
    date AS latest_hire_date,
    -- Add different time intervals
    date + INTERVAL '1 day'   AS next_day,
    date + INTERVAL '1 month' AS next_month,
    date + INTERVAL '1 year'  AS next_year,
    -- Dynamic intervals
    MAKE_INTERVAL(
        YEARS := date_part('year', CURRENT_DATE)::INTEGER
    ) AS current_year_interval,
    date + MAKE_INTERVAL(YEARS := 23) AS plus_23_years
FROM 
    latest_hire;