-- PK/índice requerido
-- ALTER TABLE regions ADD CONSTRAINT regions_pk PRIMARY KEY (region_id);

-- (Opcional) Único por nombre normalizado:
-- CREATE UNIQUE INDEX regions_name_ux ON regions (lower(btrim(region_name)));

CREATE OR REPLACE FUNCTION upsert_region(
  p_region_id   integer,
  p_region_name text
) RETURNS TABLE(region_id int, region_name text)
LANGUAGE plpgsql
AS $$
BEGIN
  IF p_region_id IS NULL THEN
    RAISE EXCEPTION 'p_region_id no puede ser NULL';
  END IF;
  IF p_region_name IS NULL OR btrim(p_region_name) = '' THEN
    RAISE EXCEPTION 'p_region_name no puede ser NULL ni vacío';
  END IF;

  INSERT INTO regions (region_id, region_name /*, created_at, updated_at */)
  VALUES (p_region_id, btrim(p_region_name) /*, now(), now() */)
  ON CONFLICT (region_id) DO UPDATE
     SET region_name = EXCLUDED.region_name
         /*, updated_at = now() */;

  RETURN QUERY
    SELECT country_id, country_name, region_name FROM countries
    INNER JOIN regions ON countries.region_id = regions.region_id;
END;
$$;

-- Uso dentro de tu transacción:
-- BEGIN;
--   SELECT * FROM upsert_region(1, 'Europe');
--   SELECT * FROM upsert_region(1, 'EU');
-- COMMIT;
