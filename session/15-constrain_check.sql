-- DOCUMENTATION https://www.postgresql.org/docs/7.2/sql-altertable.html

SELECT * from country

alter table country add CHECK (
	surfacearea >=0
)

SELECT DISTINCT continent from country

ALTER TABLE country
	ADD CHECK ((continent = 'Asia'::TEXT)
			OR(continent = 'South America'::TEXT)
				OR(continent = 'Central America'::TEXT)
					OR(continent = 'North America'::TEXT)
						OR(continent = 'Oceania'::TEXT)
							OR(continent = 'Antarctica'::TEXT)
								OR(continent = 'Africa'::TEXT)
									OR(continent = 'Europe'::TEXT))
										


SELECT * from country where code = 'CRI'

Alter table country drop CONSTRAINT "country_continent_check"


SELECT
	constraint_name,
	table_name,
	constraint_type
FROM
	information_schema.table_constraints
WHERE
	table_schema = 'public';


SELECT 
    constraint_name, 
    table_name,
    constraint_type
FROM 
    information_schema.table_constraints
WHERE 
    table_name = 'country'
    AND table_schema = 'public';  -- Cambia 'public' si la tabla está en otro esquema

