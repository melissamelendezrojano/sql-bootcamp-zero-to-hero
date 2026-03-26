# Section 4: Data Manipulation (DML)

## 1. INSERT

The `INSERT` command is used to add new rows into a table, either into an empty table or appending to existing data. You can manually specify values using `INSERT INTO ... VALUES`, ensuring the number of columns matches the number of values. 

It also supports inserting multiple rows in one statement. Additionally, data can be inserted from another table using `INSERT INTO ... SELECT`.


`NULL` --> means nothing
`Unknown` --> because can't be NULL

`CAUTION`: Columns and values must be in the same order.
```sql
INSERT INTO customers (id, first_name, country, score)
VALUES
	(6, 'Anna', 'USA', NULL),
	(7, 'Sam', NULL, 100);
```

`RULES`: Matching data types, column count & constraints.
```sql
INSERT INTO customers (id, first_name, country, score)
VALUES
	(8, 'USA', 'Max', NULL);
```

`NOTE`: You can skip the columns if you insert values for every column. **BUT** always list columns explicitly for clarity and maintainability.
```sql
INSERT INTO customers
VALUES
	(9, 'Andreas', 'Germany', NULL);
```

`NOTE`: Columns not included in INSERT become null (unless a default or constraint exists)
```sql
INSERT INTO customers (id, first_name)
VALUES
	(10, 'Sahra');
```

**SQL TASK:** Copy data from 'customers' table into 'persons'.

```sql
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
id,
first_name,
NULL,
'Unknown'
FROM customers

SELECT *
FROM persons
```

**- Results:**
| id | person_name | birth_date | phone   |
|----|-------------|------------|---------|
| 1  | Maria       | NULL       | Unknown |
| 2  | John        | NULL       | Unknown |
| 3  | Georg       | NULL       | Unknown |
| 4  | Martin      | NULL       | Unknown |
| 5  | Peter       | NULL       | Unknown |
| 6  | Anna        | NULL       | Unknown |
| 7  | Sam         | NULL       | Unknown |
| 8  | USA         | NULL       | Unknown |
| 9  | Andreas     | NULL       | Unknown |
| 10 | Sahra       | NULL       | Unknown |



## 2. UPDATE

The `UPDATE` command modifies existing data in a table by setting new values for specific columns. It requires a `WHERE` clause to target the intended rows; otherwise, all rows will be updated. 

Multiple columns can be updated in a single statement using comma-separated assignments. 

It is best practice to test the `WHERE` condition with a `SELECT` before executing the update to avoid updating whe wrong data.

**SQL TASK:** Change the score of customer with ID 6 to 0

```sql
UPDATE customers
SET score = 0
WHERE id = 6

SELECT *
FROM customers
```

**- Results:**
| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |
| 6  | Anna       | USA     | 0     |
| 7  | Sam        | NULL    | 100   |
| 8  | USA        | Max     | NULL  |
| 9  | Andreas    | Germany | NULL  |
| 10 | Sahra      | NULL    | NULL  |


**SQL TASK:** Change the score of customer with ID 10 to 0 and update the country to 'UK'

```sql
UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 10

SELECT *
FROM customers
```

**- Results:**
| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |
| 6  | Anna       | USA     | 0     |
| 7  | Sam        | NULL    | 100   |
| 8  | USA        | Max     | NULL  |
| 9  | Andreas    | Germany | NULL  |
| 10 | Sahra      | UK      | 0     |


**SQL TASK:** Update all customers with a NULL score by setting their score to 0

```sql
UPDATE customers
SET score = 0
WHERE score IS NULL

SELECT *
FROM customers
```

**- Results:**
| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |
| 6  | Anna       | USA     | 0     |
| 7  | Sam        | NULL    | 100   |
| 8  | USA        | Max     | 0     |
| 9  | Andreas    | Germany | 0     |
| 10 | Sahra      | UK      | 0     |



## 3. DELETE

The `DELETE` command removes existing rows from a table based on a `WHERE` condition. Without a `WHERE` clause, all rows in the table will be deleted, making it a high-risk operation. 

To remove all data more efficiently, `TRUNCATE TABLE` can be used, which is faster and skips logging. Unlike `DROP`, both `DELETE` and `TRUNCATE` keep the table structure intact.

**SQL TASK:** Delete all customers with an ID greater than 5

```sql
DELETE FROM customers
WHERE id > 5

SELECT *
FROM customers
```

**- Results:**
| id | first_name | country | score |
|----|------------|---------|-------|
| 1  | Maria      | Germany | 350   |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |
| 4  | Martin     | Germany | 500   |
| 5  | Peter      | USA     | 0     |


**SQL TASK:** Delete all data from the persons table

```sql
TRUNCATE TABLE persons
```
