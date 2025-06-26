-- materialized view en diferencias con las vistas normales
-- 1. las vistas normales se actualizan cada vez que se ejecuta la consulta
-- 2. Se actualizan solo cuando se ejecuta el comando REFRESH MATERIALIZED VIEW
-- 3. Se almacenan en la base de datos y se actualizan en segundo plano
-- 4. Se pueden usar en consultas complejas y se actualizan en segundo plano
-- 5. Cabe aclarar estas ocupan un espacio adicional en la base de datos.

CREATE MATERIALIZED VIEW number_claps_per_post_mat AS
SELECT 
	date_trunc('weeks', posts.created_at) as weeks, 
	COUNT(DISTINCT posts.post_id) AS number_of_posts,
	SUM( claps.counter) AS total_claps
FROM posts
INNER JOIN claps ON claps.post_id = posts.post_id
GROUP BY weeks
ORDER BY weeks DESC

REFRESH MATERIALIZED VIEW number_claps_per_post_mat

SELECT * FROM number_claps_per_post_mat