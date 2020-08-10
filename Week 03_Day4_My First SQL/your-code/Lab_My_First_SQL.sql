/* Lab | My First Queries

Open the PgAdmin server from PostgreSQL - pgAdmin 4 is a server that runs on a browser, which is pretty good for an easy start. 
If you haven't already, start a new server by passing the password you've setup. 
Create a database called **applestore** and use the `dump file` provided to import a database. 

After creating the `applestore` database, right click it and `restore` it. 
Select the dump file and hopefully pgAdmin will create the database needed for the following exercises.

Use the table to query the data about Apple Store Apps and answer the following questions: 

"id" : 				App ID
"track_name": 		App Name
"size_bytes": 		Size (in Bytes)
"currency": 		Currency Type
"price": 			Price amount
"ratingcounttot": 	User Rating counts (for all version)
"ratingcountver": 	User Rating counts (for current version)
"user_rating" : 	Average User Rating value (for all version)
"userratingver": 	Average User Rating value (for current version)
"ver" : 			Latest version code
"cont_rating": 		Content Rating
"prime_genre": 		Primary Genre
"sup_devices.num": 	Number of supporting devices
"ipadSc_urls.num": 	Number of screenshots showed for display
"lang.num": 		Number of supported languages
"vpp_lic": 			Vpp Device Based Licensing Enabled
*/

SELECT * FROM data;

-- 1. What are the different genres?
SELECT DISTINCT prime_genre FROM data;


-- 2. Which is the genre with the most apps rated?
-- The count of ratings an app has received is in the 'rating_count_tot' column.
SELECT * FROM data;
SELECT prime_genre, SUM(rating_count_tot) as sum_rating_total 
  FROM data 
 GROUP BY prime_genre 
 ORDER BY sum_rating_total DESC;
 

-- 3. Which is the genre with most apps?
SELECT prime_genre, COUNT(track_name) as total_qtd_app 
  FROM data 
 GROUP BY prime_genre 
 ORDER BY total_qtd_app  DESC;
 

-- 4. Which is the one with least?
SELECT prime_genre, COUNT(track_name) as total_qtd_app 
  FROM data 
 GROUP BY prime_genre 
 ORDER BY total_qtd_app ASC;
 

-- 5. Find the top 10 apps most rated.
SELECT * FROM data;
SELECT track_name, rating_count_tot 
  FROM data 
 ORDER BY rating_count_tot DESC
 LIMIT 10;

SELECT track_name, MAX(rating_count_tot) 
  FROM data 
 GROUP BY track_name 
 ORDER BY max DESC
 LIMIT 10;
 

-- 6. Find the top 10 apps best rated by users.
SELECT * FROM data;
SELECT track_name, 
	   MAX(user_rating) as max_user_rating
  From data 
 GROUP BY track_name 
 ORDER BY max_user_rating DESC 
 LIMIT 10;


--7. Take a look at the data you retrieved in question 5. Give some insights.
SELECT prime_genre, track_name, rating_count_tot 
  FROM data 
 ORDER BY rating_count_tot DESC
 LIMIT 10;

SELECT prime_genre, track_name, 
	   MAX(rating_count_tot)
  FROM data 
 GROUP BY prime_genre, track_name
 ORDER BY max DESC
 LIMIT 10;
 

--8. Take a look at the data you retrieved in question 6. Give some insights.
SELECT prime_genre, track_name, user_rating 
  FROM data 
 ORDER BY user_rating DESC
 LIMIT 10;

SELECT prime_genre, track_name, MAX(user_rating) 
  FROM data 
 GROUP BY track_name, prime_genre
 ORDER BY max DESC 
 LIMIT 10;


--9. Now compare the data from questions 5 and 6. What do you see?
SELECT track_name, 
	   MAX(rating_count_tot) as max_rating_count,
	   MAX(user_rating) as max_user_rating 
  FROM data 
 GROUP BY track_name
 ORDER BY max_rating_count DESC
 LIMIT 10;
 

--10. How could you take the top 3 regarding both user ratings and number of votes?
SELECT track_name, 
	   MAX(rating_count_tot) AS max_rating_count, 
	   MAX(user_rating) AS max_user_rating , 
	   SUM (rating_count_tot * user_rating ) AS rating_count_tot_X_user_rating
  FROM data 
 GROUP BY track_name
 ORDER BY rating_count_tot_X_user_rating DESC
 LIMIT 3; 
 
	
--11. Do people care about the price of an app?
--Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT track_name, 
       MAX (rating_count_tot) AS max_rating_count, 
	   MAX (user_rating) AS max_user_rating , 
	   MAX (price) AS max_price
  FROM data 
 GROUP BY track_name
 ORDER BY max_rating_count DESC
 LIMIT 10;	
/* ANSWER: As shown above, some of apps, 
		   which get higher number of max_rating (more than 20k) and medium - higher user rate, 
		   is free of charge. */


--Bonus: Find the total number of games available in more than 1 language.
SELECT * FROM data;

SELECT prime_genre, COUNT(*) 
  FROM data	
 WHERE prime_genre = 'Games' AND "lang.num" > 1
 GROUP BY prime_genre;

SELECT prime_genre, "lang.num" AS Qty_Languages, COUNT(prime_genre) 
  FROM data	
 WHERE prime_genre = 'Games' AND "lang.num" > 1
 GROUP BY prime_genre, Qty_Languages
 ORDER BY Qty_Languages DESC;
 
 
--Bonus2: Find the number of free vs paid apps
SELECT * FROM data;

SELECT COUNT(price) as qty_paid
  FROM data 
 WHERE price > 0;  

SELECT COUNT(price) as qty_free
  FROM data 
 WHERE price = 0; 

--Bonus3: Find the number of free vs paid apps for each genre
SELECT prime_genre, COUNT(*) as qty_paid
  FROM data 
 WHERE price > 0  
 GROUP BY prime_genre
 ORDER BY qty_paid DESC;
 
SELECT prime_genre, COUNT(*) as qty_free
  FROM data 
 WHERE price = 0  
 GROUP BY prime_genre
 ORDER BY qty_free DESC;

/*
Deliverables 
You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
*/