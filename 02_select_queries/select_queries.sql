-- SELECT & FROM:

-- SQL TASK: Retrieve all customer data
SELECT *
FROM customers;

-- Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 1  | Maria      | Germany | 350    |
| 2  |  John      | USA     | 900    |
| 3  | Georg      | UK      | 750    |
| 4  | Martin     | Germany | 500    |
| 5  | Peter      | USA     | 0      |
+----+------------+---------+--------+
*/

-- SQL TASK: Retrieve each customer's name, country and score
SELECT
	first_name,
	country,
	score
FROM customers;

-- Results:
/*
+------------+---------+--------+
| first_name | country | score  |
+------------+---------+--------+
| Maria      | Germany | 350    |
|  John      | USA     | 900    |
| Georg      | UK      | 750    |
| Martin     | Germany | 500    |
| Peter      | USA     | 0      |
+------------+---------+--------+
*/


-- WHERE:

-- SQL TASK: Retrieve customers with a score not equal to 0
SELECT *
FROM customers
WHERE score != 0;

--Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 1  | Maria      | Germany | 350    |
| 2  |  John      | USA     | 900    |
| 3  | Georg      | UK      | 750    |
| 4  | Martin     | Germany | 500    |
+----+------------+---------+--------+
*/

-- SQL TASK: Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 1  | Maria      | Germany | 350    |
| 4  | Martin     | Germany | 500    |
+----+------------+---------+--------+
*/


-- ORDER BY:

-- SQL TASK: Retrieve all customers and sort the results by the highest score first
SELECT *
FROM customers
ORDER BY score DESC;

-- Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 2  |  John      | USA     | 900    |
| 3  | Georg      | UK      | 750    |
| 4  | Martin     | Germany | 500    |
| 1  | Maria      | Germany | 350    |
| 5  | Peter      | USA     | 0      |
+----+------------+---------+--------+
*/

-- SQL TASK: Retrieve all customers and sort the results by the lowest score first
SELECT *
FROM customers
ORDER BY score ASC;

--Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 5  | Peter      | USA     | 0      |
| 1  | Maria      | Germany | 350    |
| 4  | Martin     | Germany | 500    |
| 3  | Georg      | UK      | 750    |
| 2  |  John      | USA     | 900    |
+----+------------+---------+--------+
*/

-- SQL TASK: Retrieve all customers and sort the results by the country and then by the highest score
SELECT *
FROM customers
ORDER BY country ASC, score DESC;

-- Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 4  | Martin     | Germany | 500    |
| 1  | Maria      | Germany | 350    |
| 3  | Georg      | UK      | 750    |
| 2  |  John      | USA     | 900    |
| 5  | Peter      | USA     | 0      |
+----+------------+---------+--------+
*/


-- GROUP BY:

-- SQL TASK: Find the total score for each country
SELECT
	country,
	SUM(score) AS country_score
FROM customers
GROUP BY country;

-- Results:
/*
+---------+----------------+
| country | country_score  |
+---------+----------------+
| Germany | 850            |
| UK      | 750            |
| USA     | 900            |
+---------+----------------+
*/

-- SQL TASK: Find the total score and total number of customers for each country
SELECT 
	country,
	SUM(score) AS country_score,
	COUNT(id) AS total_customers
FROM customers
GROUP BY country;

-- Results:
/*
+---------+---------------+------------------+
| country | country_score | total_customers  |
+---------+---------------+------------------+
| Germany | 850           | 2                |
| UK      | 750           | 1                |
| USA     | 900           | 2                |
+---------+---------------+------------------+
*/


-- HAVING:

-- SQL TASK: Find the average score for each country considering only customers with a score not equal to 0, 
--			 and return only those countries with an average score greater than 430

SELECT 
	country,
	AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;


-- DISTINCT

-- SQL TASK: Return unique list of all countries

SELECT DISTINCT country
FROM customers;

-- Results:
/*
+----------+
| country  |
+----------+
| Germany  |
| UK       |
| USA      |
+----------+
*/


-- TOP

-- SQL TASK: Retrieve only 3 customers

SELECT TOP 3 *
FROM customers;

-- Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 1  | Maria      | Germany | 350    |
| 2  |  John      | USA     | 900    |
| 3  | Georg      | UK      | 750    |
+----+------------+---------+--------+
*/

-- SQL TASK: Retrieve the top 3 customers with the highest scores

SELECT TOP 3 *
FROM customers
ORDER BY score DESC;

-- Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 2  |  John      | USA     | 900    |
| 3  | Georg      | UK      | 750    |
| 4  | Martin     | Germany | 500    |
+----+------------+---------+--------+
*/

-- SQL TASK: Retrieve the lowest 2 customers based on the score

SELECT TOP 2 *
FROM customers
ORDER BY score ASC;

-- Results:
/*
+----+------------+---------+--------+
| id | first_name | country | score  |
+----+------------+---------+--------+
| 5  | Peter      | USA     | 0      |
| 1  | Maria      | Germany | 350    |
+----+------------+---------+--------+
*/

-- SQL TASK: Get the two most recent orders

SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC;

-- Results:
/*
+----------+-------------+------------+--------+
| order_id | customer_id | order_date | sales  |
+----------+-------------+------------+--------+
| 1004     | 6           | 2021-08-31 | 10     |
| 1003     | 3           | 2021-06-18 | 20     |
+----------+-------------+------------+--------+
*/