SELECT 
    first_name,
    hire_date,
    CASE
        WHEN hire_date > (DATE '2026-01-01' - INTERVAL '100 days') THEN 
            'Recent Hire (Class A)'
        WHEN hire_date > (DATE '2026-01-01' - INTERVAL '200 days') THEN 
            'Mid-term Hire (Class B)'
        ELSE 
            'Senior Hire (Class C)' 
    END AS employee_category
FROM 
    employees
ORDER BY 
    hire_date DESC;