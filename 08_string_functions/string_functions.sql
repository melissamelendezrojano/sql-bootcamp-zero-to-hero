-- CONCAT

-- SQL TASK: Concatenate first name and country into one column

SELECT 
	first_name,
	country,
	CONCAT(first_name, '-', country) AS name_country
FROM customers;


-- UPPER & LOWER

-- SQL TASK: Convert the first name to lowercase, and to uppercase

SELECT
	first_name,
	LOWER(first_name) AS name_low,
	UPPER(first_name) AS name_up
FROM customers;


-- TRIM

-- SQL TASK: Find customers whose first name contains leading or trailing spaces

-- 1st: check if exists leading or trailing spaces
SELECT
	first_name
FROM customers
WHERE first_name != TRIM(first_name);

-- 2nd: check name's length, remove leading or trailing spaces, confirm if it has been removed

SELECT
	first_name,
	LEN(first_name) AS len_name,
	LEN(TRIM(first_name)) AS len_trim_name,
	LEN(first_name) - LEN(TRIM(first_name)) AS flag
FROM customers
WHERE LEN(first_name) - LEN(TRIM(first_name)) != 0;

-- or

SELECT
	first_name,
	LEN(first_name) AS len_name,
	LEN(TRIM(first_name)) AS len_trim_name,
	LEN(first_name) - LEN(TRIM(first_name)) AS flag
FROM customers
WHERE first_name != TRIM(first_name);

