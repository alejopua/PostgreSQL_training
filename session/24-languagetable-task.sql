

-- Tarea con countryLanguage
"CHECK"
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;

-- Crear la tabla de language
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code"));

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);

INSERT into "language" (name)
SELECT DISTINCT
	language
FROM
	countrylanguage
ORDER BY
	language ASC;

-- Empezar con el select para confirmar lo que vamos a actualizar
select language, (SELECT code from language b where b.name = a.language ) from countrylanguage a;

-- Actualizar todos los registros
update countrylanguage a
set languagecode = (SELECT code from language b where b.name = a.language );

-- Cambiar tipo de dato en countrylanguage - languagecode por int4
alter table countrylanguage
alter COLUMN languagecode TYPE int4
USING languagecode::integer;

-- Crear el foreign key y constraints de no nulo el language_code

-- Revisar lo creado
select * from countrylanguage;