--nombre de la tabla en memoria
-- campos que se van a usar en la consulta
-- la consulta que se va a ejecutar

-- ejemplo de CTE recursivo
WITH RECURSIVE countdown( val ) AS (
  --inicializacion -> valor inicial
  value ( 5 )
	SELECT 5 
  UNION ALL

  -- parte recursiva: va restando 1 mientras val > 1
  SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT val FROM countdown ORDER BY val DESC;

--------------------------------

WITH RECURSIVE countdown( val ) AS (
  --inicializacion -> valor inicial
  --VALUES ( 5 )
  SELECT 1 AS val
  UNION ALL

  -- parte recursiva: va restando 1 mientras val > 1
  SELECT val + 1 FROM countdown WHERE val < 10
)
SELECT val FROM countdown ORDER BY val ASC;

--------------------------------

WITH RECURSIVE multiplication(multiplicand, multiplier, product) AS (
  -- Seed: start at (5, 1, 1*1)
  SELECT
    5 AS multiplicand,
    1 AS multiplier,
    5 * 1 AS product

  UNION ALL

  -- Recursion: increment multiplier and compute the new product
  SELECT
    multiplicand,
    multiplier + 1,
    multiplicand * (multiplier + 1)
  FROM multiplication
  WHERE multiplier < 10
)
SELECT
  multiplicand,
  multiplier,
  product
FROM multiplication
ORDER BY multiplier;
