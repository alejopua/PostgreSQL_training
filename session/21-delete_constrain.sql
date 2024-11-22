SELECT
	a.name,
	a.continent,
	( select code FROM continent b WHERE b.name = a.continent )
FROM
	country a;

update country a set continent = ( select code FROM continent b WHERE b.name = a.continent);