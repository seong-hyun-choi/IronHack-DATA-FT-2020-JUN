-- 
CREATE TABLE example_table (nome VARCHAR(10), score SMALLINT);

/* 
DROP TABLE IF EXISTS example_table;
CREATE TABLE IF NOT EXISTS example_table (nome VARCHAR(10), score SMALLINT, idade SMALLINT);
*/

DROP TABLE IF EXISTS example_table;
CREATE TABLE IF NOT EXISTS example_table (nome VARCHAR(10), score SMALLINT, idade SMALLINT);

-- insert values into table
INSERT INTO example_table (nome, score, idade) VALUES ('Andre',10,28);
INSERT INTO example_table (nome, score, idade) VALUES ('Matheus',9,21);
INSERT INTO example_table (nome, score) VALUES ('Victor',10);
INSERT INTO example_table (idade, nome) VALUES (35, 'Alvaro');
INSERT INTO example_table VALUES ('Sera',9,29);
INSERT INTO example_table VALUES ('Julia',NULL,26);
INSERT INTO example_table (nome, score,idade) VALUES ('Victor',10, 39);

SELECT * FROM public.example_table;

-- Delete
DELETE FROM example_table WHERE idade = 39 AND nome = 'Victor';

SELECT * FROM public.example_table;

DELETE FROM example_table WHERE score IS NULL;

SELECT * FROM public.example_table;

CREATE TABLE new_table AS
SELECT DISTINCT nome, score, idade FROM example_table;


-- update
SELECT * FROM example_table;

UPDATE example_table SET score = 10 WHERE nome = 'Matheus';

-- filters
SELECT * FROM example_table WHERE score < 10 AND idade > 30;

-- select
SELECT nome FROM example_table;

-- distinct names
SELECT DISTINCT nome, score FROM example_table;

-- SELECT

SELECT * FROM buildings;

SELECT role AS profission,
	   years_employed
  FROM employees 
 WHERE role = 'Engineer';

-- find patterns
SELECT * FROM movies;

SELECT * FROM movies WHERE title = 'Toy Story';
SELECT * FROM movies WHERE title LIKE 'Toy%';
SELECT * FROM movies WHERE title LIKE 'Toy Story _';
SELECT * FROM movies WHERE title LIKE '%Story%';

SELECT * FROM movies WHERE title ~ 'Toy Story \d';

-- limit
SELECT * FROM movies LIMIT 5;

-- ORDER BY -- .sort_values(by=)
SELECT * FROM movies ORDER BY length_minutes;

SELECT * FROM movies ORDER BY length_minutes DESC LIMIT 5;

-- FUNCTION

SELECT MAX(years_employed) FROM employees;

SELECT 10 * 10 AS nome_exemplo;

SELECT AVG(years_employed) FROM employees; 


SELECT COUNT(years_employed) FROM employees;

SELECT COUNT(*) FROM example_table;

SELECT COUNT(idade) FROM example_table;

SELECT MAX(height) FROM buildings;

SELECT * FROM employees;


SELECT role, 
	   AVG(years_employed) AS avg_years_employed 
  FROM employees 
 GROUP BY role;






