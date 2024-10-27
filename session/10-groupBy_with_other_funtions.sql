SELECT
	email,
	SPLIT_PART(email, '@', 2) AS dominio
FROM
	users;

SELECT
	count(*),
	SPLIT_PART(email, '@', 2) AS dominio
FROM
	users
GROUP by SPLIT_PART(email, '@', 2)

-- --------------------------------------

SELECT
	email,
	SUBSTRING(email, POSITION('@' in email) + 1) as domain
from
	users;

SELECT
	count(*),
	SUBSTRING(email, POSITION('@' in email) + 1) as domain
FROM
	users
GROUP BY
	SUBSTRING(email, POSITION('@' IN email) + 1)
HAVING
	COUNT(*) > 1

