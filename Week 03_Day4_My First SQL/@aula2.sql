-- JOINs
SELECT * FROM movies;

SELECT * FROM movie_info;

-- INNER JOIN
SELECT * 
  FROM movies 
  	   INNER JOIN 
  	   movie_info
    ON movies.id = movie_info.movie_id;
	
-- LEFT JOIN
SELECT * 
  FROM movies
  	   LEFT JOIN
	   movie_info 
	ON movies.id = movie_info.movie_id;
	
-- FULL OUTER JOIN
SELECT * 
  FROM movies
  	   FULL OUTER JOIN
	   movie_info 
	ON movies.id = movie_info.movie_id;


-- CREATE a physical TABLE from a SELECT statement
CREATE TABLE movies_joined AS 
SELECT * 
  FROM movies
  	   FULL OUTER JOIN
	   movie_info 
	ON movies.id = movie_info.movie_id;

SELECT * FROM movies_joined;

-- if I try to create the table again with the same name, this gives us an error
DROP TABLE IF EXISTS movies_joined;

CREATE TABLE movies_joined AS 
SELECT * 
  FROM movies
  	   FULL OUTER JOIN
	   movie_info 
	ON movies.id = movie_info.movie_id;

-- specifying columns from each table
SELECT movies.title,
	   movies.director,
	   movie_info.rating
  FROM movies
  	   FULL OUTER JOIN
	   movie_info 
	ON movies.id = movie_info.movie_id;
	

-- giving aliases to tables
SELECT A.title AS titulo,
	   A.director,
	   B.rating
  FROM movies AS A
  	   LEFT JOIN
	   movie_info AS B
	ON A.id = B.movie_id;


-- Creating variables and the CASE WHEN clause
SELECT A.title AS titulo,
	   A.director,
	   B.rating,
	   B.rating * 100 AS rating_100,
	   (B.domestic_sales + B.international_sales) AS total_sales,
	   CASE 
	   		WHEN B.rating >= 8 THEN 'BOM' ELSE 'RUIM' 
		END AS flag_bom_ruim	   
  FROM movies AS A
  	   LEFT JOIN
	   movie_info AS B
	ON A.id = B.movie_id;

-- CASE WHEN with several clauses
SELECT A.title AS titulo,
	   A.director,
	   B.rating,
	   B.rating * 100 AS rating_100,
	   (B.domestic_sales + B.international_sales) AS total_sales,
	   CASE 
	   		WHEN B.rating >= 8.5 THEN 'OTIMO'
			WHEN B.rating >= 8 AND B.rating < 8.5 THEN 'BOM'
			WHEN B.rating >= 7 AND B.rating < 8 THEN 'RUIM'
			WHEN B.rating IS NULL THEN 'INVALIDO'
			ELSE 'MUITO RUIM'
		END AS flag_bom_ruim_otimo_muitoruim	   
  FROM movies AS A
  	   LEFT JOIN
	   movie_info AS B
	ON A.id = B.movie_id;



-- SUBQUERY
SELECT A.title AS titulo,
	   A.director,
	   A.year,
	   B.rating,
	   B.rating * 100 AS rating_100,
	   (B.domestic_sales + B.international_sales) AS total_sales,
	   CASE 
	   		WHEN B.rating >= 8.5 THEN 'OTIMO'
			WHEN B.rating >= 8 AND B.rating < 8.5 THEN 'BOM'
			WHEN B.rating >= 7 AND B.rating < 8 THEN 'RUIM'
			WHEN B.rating IS NULL THEN 'INVALIDO'
			ELSE 'MUITO RUIM'
		END AS flag_bom_ruim_otimo_muitoruim	   
  FROM (SELECT * FROM movies WHERE year > 2000) AS A
  	   LEFT JOIN
	   movie_info AS B
	ON A.id = B.movie_id;


SELECT * FROM (SELECT * FROM movies WHERE year > 2000) AS A;





-- Subqueries

-- Creating tables from a SELECT statement

-- Temporary Tables 

-- Views

-- Common Table Expressions (CTEs): WITH Statement