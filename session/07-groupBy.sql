SELECT
	COUNT(*) AS total_in_data,
	followers
FROM
	users
WHERE
	followers = 4
	OR followers = 4999
GROUP BY
	followers