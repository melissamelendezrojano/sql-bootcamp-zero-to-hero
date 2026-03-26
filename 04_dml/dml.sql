-- INSERT

INSERT INTO customers (id, first_name, country, score)
VALUES
	(6, 'Anna', 'USA', NULL),
	(7, 'Sam', NULL, 100);

INSERT INTO customers (id, first_name, country, score)
VALUES
	(8, 'USA', 'Max', NULL);

INSERT INTO customers
VALUES
	(9, 'Andreas', 'Germany', NULL);

INSERT INTO customers (id, first_name)
VALUES
	(10, 'Sahra');

SELECT * FROM customers;

-- SQL TASK: Copy data from 'customers' into 'persons'

INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
id,
first_name,
NULL,
'Unknown'
FROM customers

SELECT *
FROM persons


-- UPDATE

-- SQL TASK: Change the score of customer with ID 6 to 0

UPDATE customers
SET score = 0
WHERE id = 6

SELECT *
FROM customers

-- SQL TASK: Change the score of customer with ID 10 to 0 and update the country to 'UK'

UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 10

SELECT *
FROM customers

-- SQL TASK: Update all customers with a NULL score by setting their score to 0

UPDATE customers
SET score = 0
WHERE score IS NULL

SELECT *
FROM customers


-- DELETE

-- SQL TASK: Delete all customers with an ID greater than 5

DELETE FROM customers
WHERE id > 5

SELECT *
FROM customers

-- SQL TASK: Delete all data from the persons table

TRUNCATE TABLE persons

