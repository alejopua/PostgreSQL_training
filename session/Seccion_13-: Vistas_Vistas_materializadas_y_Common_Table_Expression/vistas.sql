CREATE  OR REPLACE VIEW number_claps_per_post AS
SELECT 
	date_trunc('weeks', posts.created_at) as weeks, 
	COUNT(DISTINCT posts.post_id) AS number_of_posts,
	SUM( claps.counter) AS total_claps
FROM posts
INNER JOIN claps ON claps.post_id = posts.post_id
GROUP BY weeks
ORDER BY weeks DESC

SELECT * FROM number_claps_per_post

-- para borrar vista --> DROP VIEW number_claps_per_post
-- more info https://www.postgresql.org/docs/current/sql-createview.html