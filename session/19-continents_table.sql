CREATE TABLE continent (
	"code" serial PRIMARY KEY,
	"name" text NOT NULL
);

INSERT INTO continent (name)
	SELECT DISTINCT
		continent
	FROM
		country
	ORDER BY
		continent ASC;

SELECT
	*
FROM
	continent;