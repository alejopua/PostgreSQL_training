-- 1. Ver todos los registros
SELECT
	*
FROM users;

-- 2. Ver el registro cuyo id sea igual a 10
SELECT
	*
FROM
	users
WHERE
	id = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT
	*
FROM
	users
WHERE
	name LIKE 'Jim %';

-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT
	*
FROM
	users
WHERE
	name LIKE '% Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE
	id
SET
	name = 'Alejandro Ramirez'
WHERE
	id = 1;

SELECT
	*
FROM
	users
ORDER BY
	id ASC; -- ASC | DESC

-- 6. Borrar el último registro de la tabla
DELETE FROM
    users
WHERE
    id = (
        SELECT
            id
        FROM
            users
        ORDER BY
            id DESC
        LIMIT 1
    );


DELETE FROM
    users
WHERE
    id = (
        SELECT
            max(id)
        FROM
            users
         );