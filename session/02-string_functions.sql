-- Operadores String y funciones
SELECT
	id,
	name,
	CONCAT(id, ' - ', name) as format,
	LENGTH(name) as LENGTH,
	
FROM
	users;