SELECT
	now(),
	CURRENT_DATE,
	CURRENT_TIME,
	date_part('hours', now()) AS hours,
	date_part('minutes', now()) AS minutes,
	date_part('seconds', now()) AS seconds,
	date_part('years', now()) AS YEAR,
	date_part('months', now()) AS months,
	date_part('days', now()) AS days