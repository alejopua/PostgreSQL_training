
-- JOIN'S

-- 1.INNER JOIN
select a.name as country, b.name as continent  from country a inner join continent b on a.continent = b.code order by a.name asc;

-- 2.LEFT OUTER JOIN
SELECT
	a.name AS country,
	a.continent AS continentCode,
	b.name AS continentName
FROM
	country a
	FULL OUTER JOIN continent b ON a.continent = b.code
ORDER BY
	a.name DESC;

-- 3.RIGTH OUTER JOIN WITH EXCLUSION
SELECT
	b.name
FROM
	country a
	RIGHT JOIN continent b ON a.continent = b.code
WHERE
	a.continent IS NULL;

-- 4.AGGREGATIOIN JOIN option 1
SELECT
	count(*) AS COUNT,
	b.name AS continent
FROM
	country a
	INNER JOIN continent b ON a.continent = b.code
GROUP BY
	b.name
UNION
SELECT
	count(a.continent) AS COUNT,
	b.name AS continent
FROM
	country a
	RIGHT JOIN continent b ON a.continent = b.code
WHERE
	a.continent IS NULL
GROUP BY
	b.name
ORDER BY
	COUNT;


-- 5.AGGREGATIOIN JOIN option 2
SELECT
    COUNT(a.code) AS country_count,
    b.name AS continent
FROM
    country a
RIGHT JOIN
    continent b ON a.continent = b.code
GROUP BY
    b.name
ORDER BY
    country_count ASC;