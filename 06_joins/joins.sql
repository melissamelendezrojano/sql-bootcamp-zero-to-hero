-- NO JOIN

-- SQL TASK: Retrieve all data from customers and orders as separate results.

SELECT *
FROM customers;

SELECT *
FROM orders


-- INNER JOIN

-- SQL TASK: Get all customers along with their orders, but only for customers who have placed an order.

SELECT *
FROM customers
INNER JOIN orders
ON id = customer_id

-- That works, but it's not standard best practice.

SELECT
	id,
	first_name,
	order_id,
	sales
FROM customers
INNER JOIN orders
ON id = customer_id

-- Best practice:

SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id
	

-- LEFT JOIN

-- SQL TASK: Get all customers along with their orders, including those without orders.

SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id


-- RIGHT JOIN

-- SQL TASK: Get all customers along with their orders, including orders without matching customers.

SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id

-- Using LEFT JOIN
SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id


-- FULL JOIN

-- SQL TASK: Get all customers and all orders, even if there's no match.

SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id


-- LEFT ANTI JOIN

-- SQL TASK: Get all customers who haven't placed any order.

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL


-- RIGHT ANTI JOIN

-- SQL TASK: Get all orders without matching customers.

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL

-- Without using RIGHT JOIN

SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL


-- FULL ANTI JOIN

-- SQL TASK: Find customers without orders and orders without customers.

SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL

-- SQL TASK: Get all customers along with their orders, but only for customers who have placed an order
-- without using INNER JOIN

-- My response:

SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NOT NULL AND o.customer_id IS NOT NULL

-- Suggested Response to the Instructor's Question:

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL


-- CROSS JOIN

-- SQL TASK: Generate all possible combinations of customers and orders

SELECT *
FROM customers
CROSS JOIN orders

-- MULTIPLE TABLE JOINS

/* SQL TASK: Using SalesDB, retrieve a list of all orders, along with the related customer, product, and 
employee details.*/

SELECT 
	O.OrderID,
	O.Sales,
	C.FirstName AS Customer_FirstName,
	C.LastName AS Customer_LastName,
	P.Product,
	P.Price,
	E.FirstName AS Salesperson_FirstName,
	E.LastName AS Salesperson_LastName
FROM Sales.Orders AS O
LEFT JOIN Sales.Customers AS C
ON O.CustomerID = C.CustomerID
LEFT JOIN Sales.products AS P
ON O.ProductID = P.ProductID
LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID= E.EmployeeID

