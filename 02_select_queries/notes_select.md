# Section 2: SELECT Query


## 1. Components of SQL

An SQL query is composed of statements divided into clauses (SELECT, FROM, WHERE), using keywords, identifiers (tables/columns), operators, functions, and static values.

These components form the foundation of all SQL commands, not only SELECT queries.


## 2. What is SQL Query:

An SQL query is a way to ask questions to a database and retrieve data using SELECT statements.

Queries read data without modifying tables or database structure, returning results as output.

Each query is built using clauses that define how data is selected and processed.


## 3. SELECT & FROM

SELECT defines which columns to retrieve, while FROM specifies the table where data comes from.

SQL executes queries logically starting from FROM, then applies SELECT to shape the result.

Using `SELECT *` returns all columns, while listing columns allows precise data selection.


**SQL TASK:** Retrieve all customer data.

<details>
	<summary> Click to expand expected results.</summary>
 
| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers;
```
</details>
</p>

**SQL TASK:** Retrieve each customer's name, country and score.

<details>
	<summary> Click to expand expected results.</summary>

| first_name | country | score |
|------------|---------|-------|
| Maria      | Germany | 350   |
| John       | USA     | 900   |
| Georg      | UK      | 750   |
| Martin     | Germany | 500   |
| Peter      | USA     | 0     |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	first_name,
	country,
	score
FROM customers;
```
</details>


## 4. WHERE 

The WHERE clause is used to filter rows based on one or more conditions.

SQL evaluates each row and keeps only those that satisfy the condition.

It is written after FROM and before clauses like GROUP BY or ORDER BY.


**SQL TASK:** Retrieve customers with score not equal to 0

<details>
	<summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE score != 0;
```
</details>
</p>

**SQL TASK:** Retrieve customers from Germany

<details>
	<summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 4  | Martin     | Germany | 500   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE country = 'Germany';
```
</details>
</p>


## 5. ORDER BY:

The ORDER BY clause is used to sort query results based on one or more columns.

Data can be sorted in ASC (ascending) or DESC (descending) order.

Multiple columns can be used to refine sorting when values are repeated.


**SQL TASK:** Retrieve all customers and sort the results by the highest score first

<details>
	<summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
| 1  | Maria      | Germany | 350   |
| 5  | Peter      | USA     | 0     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
ORDER BY score DESC;
```
</details>
</p>

**SQL TASK:** Retrieve all customers and sort the results by the lowest score first

<details>
	<summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 5  | Peter      | USA     | 0     |
| 1  | Maria      | Germany | 350   |
| 4  | Martin     | Germany | 500   |
| 3  | Georg      | UK      | 750   |
| 2  | John       | USA     | 900   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
ORDER BY score ASC;
```
</details>
</p>

**SQL TASK:** Retrieve all customers and sort the results by the country and then by the highest score

<details>
	<summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 4  | Martin     | Germany | 500   |
| 1  | Maria      | Germany | 350   |
| 3  | Georg      | UK      | 750   |
| 2  | John       | USA     | 900   |
| 5  | Peter      | USA     | 0     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
ORDER BY country ASC, score DESC;
```
</details>
</p>


## 6. GROUP BY

The GROUP BY clause aggregates rows that share the same value in one or more columns.

It is commonly used with aggregate functions like SUM, COUNT, or AVG.

Non-aggregated columns in SELECT must be included in the GROUP BY clause.


**SQL TASK:** Find the total score for each country

<details>
	<summary> Click to expand expected results.</summary>

| country | country_score |
|---------|---------------|
| Germany | 850           |
| UK      | 750           |
| USA     | 900           |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	country,
	SUM(score) AS country_score
FROM customers
GROUP BY country;
```
</details>
</p>


**SQL TASK:** Find the total score and total number of customers for each country

<details>
	<summary> Click to expand expected results.</summary>

| country | country_score | total_customers |
|---------|---------------|-----------------|
| Germany | 850           | 2               |
| UK      | 750           | 1               |
| USA     | 900           | 2               |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT 
	country,
	SUM(score) AS country_score,
	COUNT(id) AS total_customers
FROM customers
GROUP BY country;
```
</details>
</p>



## 7. HAVING:

The HAVING clause is used to filter aggregated results after GROUP BY.

Unlike WHERE, it works on aggregate functions such as SUM or AVG.

WHERE filters rows **before** aggregation, HAVING filters groups **after** aggregation.


**SQL TASK:** Find the average score for each country considering only customers with a score not equal to 0, and return only those countries with an average score greater than 430

<details>
	<summary> Click to expand expected results.</summary>

| country | avg_score |
|---------|-----------|
| UK      | 750       |
| USA     | 900       |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT 
	country,
	AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;
```
</details>
</p>



## 8. DISTINCT
DISTINCT removes duplicate values from the query results.

It ensures each selected value appears only once in the output.

It should be used only when duplicates exist, as it adds extra processing cost.

**SQL TASK:** Return unique list of all countries

<details>
	<summary> Click to expand expected results.</summary>

| country |
|---------|
| Germany |
| UK      |
| USA     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT DISTINCT country
FROM customers;
```
</details>
</p>


## 9. TOP

TOP is used to limit the number of rows returned in the result set.

It works based on row order, not on conditions, and is often combined with ORDER BY.

It is useful for top-N or bottom-N analysis.

**SQL TASK:** Retrieve only 3 customers

<details>
	<summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT TOP 3 *
FROM customers;
```
</details>
</p>

**SQL TASK:** Retrieve the top 3 customers with the highest scores

<details>
	<summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT TOP 3 *
FROM customers
ORDER BY score DESC;
```
</details>
</p>

**SQL TASK:** Retrieve the lowest 2 customers based on the score

<details>
	<summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 5  | Peter      | USA     | 0     |
| 1  | Maria      | Germany | 350   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT TOP 2 *
FROM customers
ORDER BY score ASC;
```
</details>
</p>

**SQL TASK:** Get the two most recent orders

<details>
	<summary> Click to expand expected results.</summary>

| order_id | customer_id | order_date | sales |
|----------|-------------|------------|-------|
| 1004     | 6           | 2021-08-31 | 10    |
| 1003     | 3           | 2021-06-18 | 20    |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC;
```
</details>
</p>


## 10. CODING & EXECUTION ORDER

SQL queries are written in a specific coding order but executed in a different logical order.

FROM and WHERE are executed first, followed by GROUP BY and HAVING.

SELECT, ORDER BY, and finally TOP are executed at the end.

<table>
<tr>
<td width="50%">
<strong>Coding order</strong> 
</p>

```sql
SELECT DISTINCT TOP 2 
	Col1,
	SUM(Col2)
FROM Table
WHERE Col = 10
GROUP BY Col1
HAVING SUM(Col2) > 30
ORDER BY Col1 DESC;
```
</td> <td width=50%">

|   | Execute order   |
|---|-----------------|
| 1 | FROM            |
| 2 | WHERE           |
| 3 | GROUP BY        |
| 4 | HAVING          |
| 5 | SELECT DISTINCT |
| 6 | ORDER BY        |
| 7 | TOP             |
</td></tr></table>



## 11. COOL SQL STUFF

SQL allows executing multiple queries in one script using semicolons.

You can select static values without tables or mix them with table data.

Query execution can be controlled by highlighting specific parts of the script.