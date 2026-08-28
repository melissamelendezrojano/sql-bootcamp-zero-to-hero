# Section 6: SQL Joins

## 1. Introduction to Joins
SQL joins are used to combine columns from multiple tables based on a shared key, typically an ID. They allow you to reconstruct distributed data, enrich datasets with additional information, or check the existence of records in another table. Before combining tables, you must decide whether to join columns (joins) or stack rows (set operators). Joins rely on relationships between tables to produce meaningful results.

### Structure:
```sql
SELECT *
FROM A
[TYPE] JOIN B
ON <Condition>
```

## 2. No Join
“No Join” means querying multiple tables separately without combining them. Each table is retrieved using independent `SELECT` statements, producing separate result sets. This approach is useful when there is no need to relate or merge the data. It is not technically a join, as no relationship or condition is applied between tables.

**SQL TASK**: Retrieve all data from customers and orders as separate results.

<details>
	<summary> Click to expand expected results.</summary>
 
| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |

| order_id | customer_id | order_date | sales |
|----------|-------------|------------|-------|
| 1001     | 1           | 2021-01-11 | 35    |
| 1002     | 2           | 2021-04-05 | 15    |
| 1003     | 3           | 2021-06-18 | 20    |
| 1004     | 6           | 2021-08-31 | 10    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers;

SELECT *
FROM orders
```
</details>
</p>



## 3. Inner Join
An `INNER JOIN` returns only the rows that have matching values in both tables. It filters out any data that does not have a corresponding match, making it useful for strict relationships. The join is performed using a common key, and only intersecting data is included. Table order does not affect the result.

**SQL TASK**: Get all customers along with their orders, but only for customers who have placed an order.

<details>
	<summary> Click to expand expected results.</summary>
 
| id | first_name | country | score | order_id | customer_id | order_date | sales |
|----|------------|---------|-------|----------|-------------|------------|-------|
| 1  | Maria      | Germany | 350   | 1001     | 1           | 2021-01-11 | 35    |
| 2  | John       | USA     | 900   | 1002     | 2           | 2021-04-05 | 15    |
| 3  | Georg      | UK      | 750   | 1003     | 3           | 2021-06-18 | 20    |


</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
INNER JOIN orders
ON id = customer_id
```
</details>
</p>

That works, but it's not standard best practice:

<details>
	<summary> Click to expand expected results.</summary>
 
| id | first_name | order_id | sales |
|----|------------|----------|-------|
| 1  | Maria      | 1001     | 35    |
| 2  | John       | 1002     | 15    |
| 3  | Georg      | 1003     | 20    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	id,
	first_name,
	order_id,
	sales
FROM customers
INNER JOIN orders
ON id = customer_id
```
</details>
</p>

Best practice:

<details>
	<summary> Click to expand expected results.</summary>
 
| id | first_name | order_id | sales |
|----|------------|----------|-------|
| 1  | Maria      | 1001     | 35    |
| 2  | John       | 1002     | 15    |
| 3  | Georg      | 1003     | 20    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id
```
</details>
</p>



## 4. Left Join
A `LEFT JOIN` returns all rows from the left table and only the matching rows from the right table. If no match exists, NULL values are returned for the right table’s columns. It is useful when the left table is the primary dataset and must not lose any records. Table order is critical in this type of join.

**SQL TASK**: Get all customers along with their orders, including those without orders.


<details>
	<summary> Click to expand expected results.</summary>
 
| id | first_name | order_id | sales |
|----|------------|----------|-------|
| 1  | Maria      | 1001     | 35    |
| 2  | John       | 1002     | 15    |
| 3  | Georg      | 1003     | 20    |
| 4  | Martin     | NULL     | NULL  |
| 5  | Peter      | NULL     | NULL  |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
```
</details>
</p>


## 5. Right Join
A `RIGHT JOIN` returns all rows from the right table and only the matching rows from the left table. If there is no match, NULL values appear for the left table’s columns. It is essentially the opposite of a left join, prioritizing the right table. Often, it can be replaced by switching table order and using a left join.

**SQL TASK**: Get all customers along with their orders, including orders without matching customers.


<details>
	<summary> Click to expand expected results.</summary>
 
| id   | first_name | customer_id | sales |
|------|------------|-------------|-------|
| 1    | Maria      | 1           | 35    |
| 2    | John       | 2           | 15    |
| 3    | Georg      | 3           | 20    |
| NULL | NULL       | 6           | 10    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
```
</details>
</p>

Using LEFT JOIN:

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
```
</details>
</p>


## 6. Full Join
A `FULL JOIN` returns all rows from both tables, including matching and non-matching data. When there is no match, NULL values are used to fill missing fields. It combines the effects of left and right joins, ensuring no data is lost. This join is useful when both tables are equally important.

**SQL TASK**: Get all customers and all orders, even if there's no match.

<details>
	<summary> Click to expand expected results.</summary>
 
| id   | first_name | customer_id | sales |
|------|------------|-------------|-------|
| 1    | Maria      | 1           | 35    |
| 2    | John       | 2           | 15    |
| 3    | Georg      | 3           | 20    |
| 4    | Martin     | NULL        | NULL  |
| 5    | Peter      | NULL        | NULL  |
| NULL | NULL       | 6           | 10    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
```
</details>
</p>


## 7. LEFT ANTI JOIN
A LEFT ANTI JOIN returns rows from the left table that have no matching records in the right table. It is implemented using a `LEFT JOIN` combined with a `WHERE` clause filtering for `NULL` values on the right-side key. This pattern is commonly used to detect non-existing relationships, such as customers without orders. The right table acts only as a filter, not a data source.

### Structure:
```sql
SELECT *
FROM A
LEFT JOIN B
ON A.key = B.key
WHERE B.key IS NULL
```

**SQL TASK**: Get all customers who haven't placed any order.

<details>
	<summary> Click to expand expected results.</summary>
 
 | id | first_name | country | score | order_id | customer_id | order_date | sales |
|----|------------|---------|-------|----------|-------------|------------|-------|
| 4  | Martin     | Germany | 500   | NULL     | NULL        | NULL       | NULL  |
| 5  | Peter      | USA     | 0     | NULL     | NULL        | NULL       | NULL  |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL
```
</details>
</p>


## 8. RIGHT ANTI JOIN
A RIGHT ANTI JOIN is the opposite of a left anti join: it returns rows from the right table that have no match in the left table. It is created using a `RIGHT JOIN` with a `WHERE` condition checking for `NULL` in the left table key. In practice, it is often replaced by swapping table positions and using a left anti join. It is useful for identifying orphan records, like orders without valid customers.

**SQL TASK**: Get all orders without matching customers.

<details>
	<summary> Click to expand expected results.</summary>
 
| id   | first_name | country | score | order_id | customer_id | order_date | sales |
|------|------------|---------|-------|----------|-------------|------------|-------|
| NULL | NULL       | NULL    | NULL  | 1004     | 6           | 2021-08-31 | 10    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL
```
</details>
</p>

Without using RIGHT JOIN:

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL
```
</details>
</p>

## 9. FULL ANTI JOIN
A FULL ANTI JOIN returns all non-matching rows from both tables, excluding any overlapping data. It is built using a `FULL JOIN` and a `WHERE` clause that checks if either side’s key is `NULL`. This allows detection of inconsistencies in both directions, such as customers without orders and orders without customers. It represents the inverse of an inner join.

**SQL TASK**: Find customers without orders and orders without customers.

<details>
	<summary> Click to expand expected results.</summary>
 
| id   | first_name | country | score | order_id | customer_id | order_date | sales |
|------|------------|---------|-------|----------|-------------|------------|-------|
| 4    | Martin     | Germany | 500   | NULL     | NULL        | NULL       | NULL  |
| 5    | Peter      | USA     | 0     | NULL     | NULL        | NULL       | NULL  |
| NULL | NULL       | NULL    | NULL  | 1004     | 6           | 2021-08-31 | 10    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL
```
</details>
</p>

**SQL TASK**: Get all customers along with their orders, but only for customers who have placed an order. Without using INNER JOIN

<details>
	<summary> Click to expand expected results.</summary>
 
| id | first_name | country | score | order_id | customer_id | order_date | sales |
|----|------------|---------|-------|----------|-------------|------------|-------|
| 1  | Maria      | Germany | 350   | 1001     | 1           | 2021-01-11 | 35    |
| 2  | John       | USA     | 900   | 1002     | 2           | 2021-04-05 | 15    |
| 3  | Georg      | UK      | 750   | 1003     | 3           | 2021-06-18 | 20    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
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
```
</details>
</p>



## 10. CROSS JOIN
A CROSS JOIN returns all possible combinations between two tables (Cartesian product), without considering matching conditions.  
The total number of rows equals rows in A multiplied by rows in B, which can grow very quickly.  
It does not require an `ON` clause since no relationship is evaluated.  
Common use cases include generating test data or combining dimensions like products and colors.

**SQL TASK**: Generate all possible combinations of customers and orders

<details>
	<summary> Click to expand expected results.</summary>
 
| id | first_name | country | score | order_id | customer_id | order_date | sales |
|----|------------|---------|-------|----------|-------------|------------|-------|
| 1  | Maria      | Germany | 350   | 1001     | 1           | 2021-01-11 | 35    |
| 2  | John       | USA     | 900   | 1001     | 1           | 2021-01-11 | 35    |
| 3  | Georg      | UK      | 750   | 1001     | 1           | 2021-01-11 | 35    |
| 4  | Martin     | Germany | 500   | 1001     | 1           | 2021-01-11 | 35    |
| 5  | Peter      | USA     | 0     | 1001     | 1           | 2021-01-11 | 35    |
| 1  | Maria      | Germany | 350   | 1002     | 2           | 2021-04-05 | 15    |
| 2  | John       | USA     | 900   | 1002     | 2           | 2021-04-05 | 15    |
| 3  | Georg      | UK      | 750   | 1002     | 2           | 2021-04-05 | 15    |
| 4  | Martin     | Germany | 500   | 1002     | 2           | 2021-04-05 | 15    |
| 5  | Peter      | USA     | 0     | 1002     | 2           | 2021-04-05 | 15    |
| 1  | Maria      | Germany | 350   | 1003     | 3           | 2021-06-18 | 20    |
| 2  | John       | USA     | 900   | 1003     | 3           | 2021-06-18 | 20    |
| 3  | Georg      | UK      | 750   | 1003     | 3           | 2021-06-18 | 20    |
| 4  | Martin     | Germany | 500   | 1003     | 3           | 2021-06-18 | 20    |
| 5  | Peter      | USA     | 0     | 1003     | 3           | 2021-06-18 | 20    |
| 1  | Maria      | Germany | 350   | 1004     | 6           | 2021-08-31 | 10    |
| 2  | John       | USA     | 900   | 1004     | 6           | 2021-08-31 | 10    |
| 3  | Georg      | UK      | 750   | 1004     | 6           | 2021-08-31 | 10    |
| 4  | Martin     | Germany | 500   | 1004     | 6           | 2021-08-31 | 10    |
| 5  | Peter      | USA     | 0     | 1004     | 6           | 2021-08-31 | 10    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
CROSS JOIN orders
```
</details>
</p>



## 11. HOW TO CHOOSE THE CORRECT JOIN
Choosing a join depends on the desired result: use INNER JOIN for matching data only.  
Use LEFT JOIN when one table is primary and you need all its records, and FULL JOIN when both tables are equally important.  
For unmatched data analysis, use LEFT or FULL ANTI JOIN depending on whether one or both tables matter.  
This decision process acts like a mental tree to systematically select the appropriate join type.


## 12. MULTIPLE TABLE JOINS
In data analysis, queries typically start from a main (master) table and progressively add related data using LEFT JOINs.  
Additional tables enrich the dataset, while the WHERE clause controls filtering and final output logic.  
Correct join keys and aliases are critical to avoid ambiguity and ensure accurate results.  
Alternatively, INNER JOINs can be used when only overlapping data across all tables is required.

**SQL TASK**: Using SalesDB, retrieve a list of all orders, along with the related customer, product, and 
employee details.

<details>
	<summary> Click to expand expected results.</summary>
 
| OrderID | Sales | Customer_FirstName | Customer_LastName | Product | Price | Salesperson_FirstName | Salesperson_LastName |
|---------|-------|--------------------|-------------------|---------|-------|-----------------------|----------------------|
| 1       | 10    | Kevin              | Brown             | Bottle  | 10    | Mary                  | NULL                 |
| 2       | 15    | Mary               | NULL              | Tire    | 15    | Mary                  | NULL                 |
| 3       | 20    | Jossef             | Goldberg          | Bottle  | 10    | Carol                 | Baker                |
| 4       | 60    | Jossef             | Goldberg          | Gloves  | 30    | Mary                  | NULL                 |
| 5       | 25    | Kevin              | Brown             | Caps    | 25    | Carol                 | Baker                |
| 6       | 50    | Mary               | NULL              | Caps    | 25    | Carol                 | Baker                |
| 7       | 30    | Jossef             | Goldberg          | Tire    | 15    | Frank                 | Lee                  |
| 8       | 90    | Mark               | Schwarz           | Bottle  | 10    | Mary                  | NULL                 |
| 9       | 20    | Kevin              | Brown             | Bottle  | 10    | Mary                  | NULL                 |
| 10      | 60    | Mary               | NULL              | Tire    | 15    | Carol                 | Baker                |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
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
```
</details>
</p>
