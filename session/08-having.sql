
	SELECT
		count(*),
		SUBSTRING(email, POSITION('@' IN email) + 1) AS DOMAIN
	FROM
		users
	GROUP BY
		SUBSTRING(email, POSITION('@' IN email) + 1)
	HAVING
		COUNT(*) > 1