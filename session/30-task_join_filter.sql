

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

SELECT
	count(*) AS total,
	'America' AS continent
FROM
	country a
	INNER JOIN continent b ON a.continent = b.code
WHERE
	lower(b.name) LIKE '%america%'
UNION
SELECT
	COUNT(a.code) AS total,
	b.name AS continent
FROM
	country a
	RIGHT JOIN continent b ON a.continent = b.code
WHERE
	lower(b.name) NOT LIKE '%america%'
GROUP BY
	b.name
ORDER BY
	total ASC;


-- task 2
SELECT
	count(a.countrycode) AS total,
	b.name AS country
FROM
	city a
	INNER JOIN country b ON a.countrycode = b.code
GROUP BY
	country
ORDER BY
	total DESC
LIMIT
	1;

-- task 3
SELECT
	count(*), continent
FROM
	(
		SELECT DISTINCT
			d.name as language,
			c."name" continent
		FROM
			countrylanguage a
			INNER JOIN country b ON a.countrycode = b.code
			INNER JOIN continent c ON b.continent = c.code
			inner join language d on a.languagecode = d.code
		WHERE
			isofficial = TRUE
		ORDER BY
			continent ASC
	) AS totales
	GROUP by continent;

  -- task 4
  SELECT
	count(*) AS total,
	b.languagecode,
	b."language"
FROM
	country a
	INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE
	a.continent = 5
	AND b.isofficial = TRUE
GROUP BY
	b.languagecode,
	b."language"
ORDER BY
	count(*) DESC
LIMIT
	1;

-- task 5
SELECT
	*
FROM
	country a
	INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE
	a.continent = 5
	AND b.isofficial = TRUE
	AND b.languagecode = 135;