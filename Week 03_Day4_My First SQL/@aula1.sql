CREATE TABLE ironhack ( /* comment here */
	nome varchar(50), --text
	idade smallint 
);

INSERT INTO ironhack VALUES ('Andre', 28);

-- select all from ironhack
SELECT * FROM ironhack;

INSERT INTO ironhack VALUES ('Yuri', 29);

SELECT * FROM ironhack;

SELECT * FROM cities;

UPDATE cities SET "Population" = 0 WHERE "Population" < 1600000;

SELECT * FROM cities;

DELETE FROM cities WHERE "Population" = 0;

SELECT * FROM cities;

-- SELECT 
SELECT * FROM cities;

-- Select specific columns
SeLeCt "City", "Population" FrOm cities; 

-- Select and rename columns
SELECT "City" AS cidade, 
	   "Population" AS pop,
	   "Latitude",
	   "Longitude"
  FROM cities;  -- não altera a tabela original

-- WHERE: filtros
SELECT * 
  FROM movies 
 WHERE year < 2000 
   AND length_minutes < 90;


-- LIMIT: limita a quantidade de linhas a ser mostrada
SELECT * FROM movies LIMIT 5;

-- OFFSET: 
SELECT * FROM movies LIMIT 5 OFFSET 2;

-- ORDER ROWS (default: ASCENDING):
SELECT * FROM movies ORDER BY length_minutes;

-- ORDER ROWS - the same as :
SELECT * FROM movies ORDER BY length_minutes ASC;

-- DESCENDING
SELECT title, 
	   length_minutes 
  FROM movies 
 ORDER BY length_minutes DESC 
 LIMIT 3;
 

-- Aggregating Functions: 

-- count all rows
SELECT COUNT(*) AS qtd_linhas FROM movies;

-- count rows where year > 2000
SELECT COUNT(*) AS qtd_filmes_greater_2000
  FROM movies 
 WHERE year > 2000;
 
 
-- count how many non-missing 'title'
SELECT COUNT(title) FROM movies;

SELECT COUNT(*) FROM employees; -- this returns 15
SELECT COUNT(building) FROM employees; -- this returns 13

-- Max 
SELECT * FROM movies;
SELECT MAX(length_minutes) FROM movies;


-- DISTINCT: parecido com o .unique() do pandas
SELECT DISTINCT director FROM movies;

-- DISTINCT *: parecido com .drop_duplicates()
SELECT DISTINCT * FROM movies;

SELECT * FROM ironhack;
INSERT INTO ironhack VALUES ('Andre', 28);
SELECT * FROM ironhack;

SELECT DISTINCT * FROM ironhack;

-- GROUP BY
SELECT * FROM movies;


SELECT director, 
	   COUNT(*) AS qtd_filmes, 
	   AVG(length_minutes) AS media_tempo_filme
  FROM movies 
 WHERE year > 2000
 GROUP BY director
 ORDER BY media_tempo_filme DESC -- decrescente
 LIMIT 3;


