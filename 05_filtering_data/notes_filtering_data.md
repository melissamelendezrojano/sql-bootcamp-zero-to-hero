# Section 5: Filtering Data

## 1. Comparison operators

Comparison operators in SQL are used to evaluate conditions by comparing two expressions, such as columns, values, functions, or even subqueries. 

Common operators include `=`, `!=` or `<>`, `>`, `<`, `>=`, and `<=`. These comparisons return boolean results (true/false) and are mainly used in the `WHERE` clause to filter rows. SQL processes each row individually and keeps only those that satisfy the condition.

CONDITION --> Expression - `Operator` - Expression

| CONDITION          | EXAMPLE                                |
|--------------------|----------------------------------------|
| Column1 = Column2  | first_name = last_name                 |
| Column1 = Value    | first_name = 'John'                    |
| Function = Value   | UPPER(first_name) = 'John'             |
| Expression = Value | Price * Quantity = 1000                |
| Subquery = Value   | (SELECT AVG(Sales) FROM Orders) = 1000 |


| OPERATOR |                                                             |
|----------|-------------------------------------------------------------|
| =        | Checks if two values are equal                              |
| <>  !=   | Checks if two values are not equal                          |
| >        | Checks if a value is greater than another value             |
| >=       | Checks if a value is greater than or equal to another value |
| <        | Checks if a value is less than another value                |
| <=       | Checks if a value is less than or equal to another value    |


**SQL TASK:** Retrieve all customers from Germany

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
WHERE country = 'Germany'
```
</details>
</p>

**SQL TASK:** Retrieve all customers who are not from Germany

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 5  | Peter      | USA     | 0     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE country <> 'Germany'
```
</details>
</p>


**SQL TASK:** Retrieve all customers with a score greater than 500

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE score > 500
```
</details>
</p>


**SQL TASK:** Retrieve all customers with a score of 500 or more

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
SELECT *
FROM customers
WHERE score >= 500
```
</details>
</p>


**SQL TASK:** Retrieve all customers with a score less than 500

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 5  | Peter      | USA     | 0     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE score < 500
```
</details>
</p>


**SQL TASK:** Retrieve all customers with a score of 500 or less

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE score <= 500
```
</details>
</p>


## 2. AND Operator

The `AND` operator is a logical operator used to combine multiple conditions where **all must be true** for a row to be included in the result. It is highly restrictive, meaning that if any condition fails, the entire expression evaluates to false. 

This operator is commonly used when applying multiple filters that must all be satisfied simultaneously.

`AND` --> All conditions must be TRUE.

**SQL TASK:** Retrieve all customers who are from the USA AND have a score greater than 500

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 2  | John       | USA     | 900   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE country = 'USA' AND score > 500
```
</details>
</p>


## 3. OR Operator

The `OR` operator allows combining multiple conditions where **at least one must be true**. It is less restrictive than `AND`, as it accepts rows that satisfy any of the given conditions. This makes it useful for broad searches or when multiple alternative criteria are acceptable.

`OR`--> At least one condition must be TRUE.

**SQL TASK:** Retrieve all customers who are either from the USA OR have a score greater than 500

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 5  | Peter      | USA     | 0     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500
```
</details>
</p>


## 4. NOT Operator

The `NOT` operator reverses the result of a condition, turning true into false and vice versa. It is applied to a single condition to exclude matching values. This is useful when you want to filter out specific data rather than include it.

`NOT`--> (Reverse) Excludes matching values

**SQL TASK:** Retrieve all customers with a score NOT less than 500

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
SELECT *
FROM customers
WHERE NOT score < 500
```
</details>
</p>


## 5. BETWEEN Operator

The `BETWEEN` operator checks whether a value falls within a specified range, defined by a lower and upper boundary. It is inclusive, meaning both boundary values are considered valid. 

It simplifies range conditions but can also be replaced by combining comparison operators with `AND`.

`BETWEEN`--> Check if a value is within a range, including lower and upper boundary

**SQL TASK:** Retrieve all customers whose score falls in the range between 100 and 500

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
WHERE score BETWEEN 100 AND 500

-- OTHER OPTION

SELECT *
FROM customers
WHERE score >= 100 AND score <= 500
```
</details>
</p>


## 7. IN Operator

The `IN` operator tests whether a value exists within a predefined list of values. It provides a cleaner and more efficient alternative to multiple `OR` conditions on the same column. The `NOT IN` variant excludes values found in the list.

`IN`--> Check if a value exists in a list

**SQL TASK:** Retrieve all customers from either Germany or USA

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE country IN ('Germany', 'USA')
```
</details>
</p>


## 8. LIKE Operators

The `LIKE` operator is used for pattern matching within text data. It supports wildcards such as `%` (any sequence of characters) and `_` (a single character). 

This operator is essential for flexible searches, such as finding values that start with, end with, or contain specific patterns.

`LIKE`--> Search for a pattern in text

**SQL TASK:** Find all customers whose first name starts with 'M'

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
WHERE first_name LIKE 'M%'
```
</details>
</p>


**SQL TASK:** Find all customers whose first name ends with 'n'

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 2  | John       | USA     | 900   |
| 4  | Martin     | Germany | 500   |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE first_name LIKE '%n'
```
</details>
</p>


**SQL TASK:** Find all customers whose first name contains 'r'

<details>
    <summary> Click to expand expected results.</summary>

| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |
</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT *
FROM customers
WHERE first_name LIKE '%r%'
```
</details>
</p>


**SQL TASK:** Find all customers whose first name has 'r' in the third position

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
WHERE first_name LIKE '__r%'
```
</details>
</p>