-- Asegúrate de tener la PK en region_id
-- ALTER TABLE regions ADD CONSTRAINT regions_pk PRIMARY KEY (region_id);

CREATE OR REPLACE PROCEDURE insert_region_proc(
    p_region_id   integer,
    p_region_name text
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_region_id IS NULL THEN
        RAISE EXCEPTION 'p_region_id no puede ser NULL';
    END IF;
    IF p_region_name IS NULL OR btrim(p_region_name) = '' THEN
        RAISE EXCEPTION 'p_region_name no puede ser NULL ni vacío';
    END IF;

    INSERT INTO regions (region_id, region_name)
    VALUES (p_region_id, btrim(p_region_name))
    ON CONFLICT (region_id)
    DO UPDATE SET region_name = EXCLUDED.region_name;
END;
$$;

-- Uso:
-- CALL insert_region_proc(1, 'Europe');
