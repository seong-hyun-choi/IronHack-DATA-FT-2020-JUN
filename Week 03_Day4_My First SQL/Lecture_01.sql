-- SQL: Structed Query Language 
/* 
CREATE
	CREATE TABLE table (column_name type, …);
	CREATE TABLE IF NOT EXISTS table (column_name type, …);
DROP
	DROP TABLE table;
	DROP TABLE IF EXISTS table; 
INSERT
	INSERT INTO table (column, …) VALUES (value, …);
SELECT
	SELECT * FROM table;
	SELECT columns FROM table;
	SELECT DISTINCT * FROM table;
	SELECT DISTINCT column, column FROM table;
	SELECT * FROM table WHERE condition(s)
UPDATE
	UPDATE table SET column = x  WHERE condition;
DELETE
	DELETE FROM table WHERE condition;
	DELETE FROM table WHERE condition AND condition;
pattern
	SELECT * FROM table WHERE column LIKE '%xxx%'
limit 
	SELECT * FROM table LIMIT 10
ORDER BY
	SELECT * FROM table ORDER BY column
	SELECT * FROM table ORDER BY column DESC;
	
GROUP BY
	SELECT column1, 
		   AVG(column2) AS average_column2 
	FROM table
	GROUP BY column1;
*/

-- create the table
CREATE TABLE example_table (nome VARCHAR(10), score SMALLINT);
-- drop the table
DROP TABLE example_table;

-- create and drop the table IF EXISTS / IF NOT EXISTS
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

-- select
SELECT * FROM example_table;

-- delete
DELETE FROM example_table WHERE idade=39 AND nome='Victor';
SELECT * FROM example_table;

DELETE FROM example_table WHERE score ISNULL;
SELECT * FROM example_table;

-- select distinct 
CREATE TABLE new_table AS
	SELECT DISTINCT nome, score, idade FROM example_table;
SELECT * FROM new_table;

-- update
SELECT * FROM example_table;
UPDATE example_table SET score = 10 WHERE nome ='Matheus';
SELECT * FROM example_table;

--filter WHERE
SELECT * FROM example_table WHERE score < 10 AND idade < 30;

-- distinct names
SELECT DISTINCT nome, score FROM example_table;

-- select
SELECT * FROM buildings;
SELECT * FROM employees;

-- rename column using AS & filter using WHERE
SELECT role as profession, 
	   years_employed
  FROM employees
 WHERE role = 'Engineer';
 
-- find patterns
SELECT * FROM movies;

SELECT * FROM movies WHERE title ='Toy Story';
SELECT * FROM movies WHERE title LIKE 'Toy%';
SELECT * FROM movies WHERE title LIKE 'Toy Story _';
SELECT * FROM movies WHERE title LIKE '%Story%';

SELECT * FROM movies WHERE title ~'Toy Story \d';

-- limit
SELECT * FROM movies LIMIT 5;

-- ORDER BY -- .sort_values(by=)
SELECT * FROM movies ORDER BY length_minutes;
SELECT * FROM movies ORDER BY length_minutes DESC LIMIT 5;


-- FUNCTION (MAX,MIN, COUNT, AVG,...)
SELECT * FROM employees;
SELECT MAX(years_employed) building FROM employees;

SELECT 10 * 10 AS nome_exemplo;

SELECT AVG(years_employed) FROM employees; 
SELECT COUNT(years_employed) FROM employees;
SELECT COUNT(*) FROM example_table;
SELECT COUNT(idade) FROM example_table;
SELECT MAX(height) FROM buildings;

SELECT * FROM employees;

-- GROUP BY
SELECT role, 
	   AVG(years_employed) AS avg_years_employed 
  FROM employees 
 GROUP BY role;


