SELECT * FROM country WHERE continent = 'Africa'

create UNIQUE INDEX "unique_country_name" on country (
	NAME
)