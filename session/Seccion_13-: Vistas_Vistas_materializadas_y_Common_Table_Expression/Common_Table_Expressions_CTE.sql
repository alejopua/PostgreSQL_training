-- more info 
--https://www.postgresql.org/docs/current/queries-with.html
--https://gist.github.com/Klerith/080066dcfb992a80f69f136650d249fd

--CASOS DE USO
--1. Para cuando necesitemos hacer querys recursivos
--2. para simplificar nuestros querys

with posts_week_2024 as (
 	 SELECT date_trunc('week'::text, posts.created_at) AS weeks,
    sum(claps.counter) AS total_claps,
    count(DISTINCT posts.post_id) AS number_of_posts,
    count(*) AS number_of_claps
   FROM posts
     JOIN claps ON claps.post_id = posts.post_id
  GROUP BY (date_trunc('week'::text, posts.created_at))
  ORDER BY (date_trunc('week'::text, posts.created_at)) DESC
)
 
SELECT * FROM posts_week_2024
WHERE weeks BETWEEN '2024-01-01' AND '2024-12-31' AND total_claps >= 600