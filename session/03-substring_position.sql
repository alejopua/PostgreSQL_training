SELECT
	name,
	SUBSTRING(name, 0, POSITION(' ' in name)) as first_name,
	SUBSTRING(name, POSITION(' ' IN name) + 1) as last_name
FROM
	users;

SELECT * 
FROM users;

UPDATE
	users
SET
	first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),
	last_name = SUBSTRING(name, POSITION(' ' IN name) + 1);