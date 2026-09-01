# Section 7: SQL SET Operators

## 1. Introduction to Set Operators
Set operators in SQL are used to combine rows from two or more tables, unlike joins which combine columns. There are four main types: `UNION`, `UNION ALL`, `EXCEPT`, and `INTERSECT`. They allow row-level combination while adhering to specific rules for consistency and correctness. Understanding set operators is key for merging datasets efficiently.

## 2. Set Rules & Syntax
Set operators require two queries separated by the operator. 

Rules include: 
- `ORDER BY` can only appear at the end of the combined query.
- The number of columns must match.
- Column data types must be compatible.
- Column order must be consistent.
- The first query defines output column names.
- Correct mapping of data is the user’s responsibility for accurate results.

### Structure:
```sql
-- 1st SELECT statement
SELECT
    FirstName,
    LastName
FROM Customers

-- SET operator
UNION

-- 2nd SELECT statement
SELECT
    FirstName,
    LastName
FROM Employees
```

## 3. UNION
`UNION` combines two queries and returns only distinct rows. Duplicate values are automatically removed, ensuring each row appears once. It is useful when merging datasets where duplicates should not exist, maintaining a clean, consolidated output.

**SQL TASK**: Combine the data from employees and customers into one table

<details>
	<summary> Click to expand expected results.</summary>

| FirstName | LastName |
|-----------|----------|
| Anna      | Adams    |
| Carol     | Baker    |
| Frank     | Lee      |
| Jossef    | Goldberg |
| Kevin     | Brown    |
| Mark      | Schwarz  |
| Mary      | NULL     |
| Michael   | Ray      |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT 
	FirstName,
	LastName
FROM Sales.Employees
UNION
SELECT
	FirstName,
	LastName
FROM Sales.Customers
```
</details>
</p>


## 4. UNION ALL
`UNION ALL` merges rows from two queries without removing duplicates. It is faster than `UNION` because it skips the de-duplication step. It is ideal when duplicates are expected, or when performance is critical and duplicate removal is unnecessary.

**SQL TASK**: Combine the data from employees and customers into one table, including duplicates.

<details>
	<summary> Click to expand expected results.</summary>
 
| FirstName | LastName |
|-----------|----------|
| Frank     | Lee      |
| Kevin     | Brown    |
| Mary      | NULL     |
| Michael   | Ray      |
| Carol     | Baker    |
| Jossef    | Goldberg |
| Kevin     | Brown    |
| Mary      | NULL     |
| Mark      | Schwarz  |
| Anna      | Adams    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT 
	FirstName,
	LastName
FROM Sales.Employees
UNION ALL
SELECT
	FirstName,
	LastName
FROM Sales.Customers
```
</details>
</p>


## 5. EXCEPT
`EXCEPT` returns rows from the first query that do not exist in the second query. The order of queries matters, as reversing them changes the result. It also removes duplicates and is used to identify non-overlapping data between two datasets.

**SQL TASK**: Find employees who are not customers at the same time

<details>
	<summary> Click to expand expected results.</summary>
 
| FirstName | LastName |
|-----------|----------|
| Carol     | Baker    |
| Frank     | Lee      |
| Michael   | Ray      |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT 
	FirstName,
	LastName
FROM Sales.Employees
EXCEPT
SELECT
	FirstName,
	LastName
FROM Sales.Customers
```
</details>
</p>


## 6. INTERSECT
`INTERSECT` returns only rows common to both queries, similar to an inner join. Duplicates are removed automatically. The order of queries does not affect the result, making it ideal for finding shared data between two tables.

**SQL TASK**: Find employees who are also customers

<details>
	<summary> Click to expand expected results.</summary>
 
| FirstName | LastName |
|-----------|----------|
| Kevin     | Brown    |
| Mary      | NULL     |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT 
	FirstName,
	LastName
FROM Sales.Employees
INTERSECT
SELECT
	FirstName,
	LastName
FROM Sales.Customers
```
</details>
</p>


## 7. Use Case: Combine Information
Set operators are useful for consolidating similar tables before analysis. For example, combining employees, customers, suppliers, and students into one table allows a single query for reporting. Using `UNION` or `UNION ALL` simplifies data management, ensures consistency, and facilitates accurate analysis by preparing a unified dataset.

**SQL TASK**: Orders are stored in separate tables (Orders and OrdersArchive).
Combine all orders into one report without duplicates.

<details>
	<summary> Click to expand expected results.</summary>

| SourceTable   | OrderID | ProductID | CustomerID | SalesPersonID | OrderDate  | ShipDate   | OrderStatus | ShipAddress        | BillAddress    | Quantity | Sales | CreationTime                |
|---------------|---------|-----------|------------|---------------|------------|------------|-------------|--------------------|----------------|----------|-------|-----------------------------|
| Orders        | 1       | 101       | 2          | 3             | 2025-01-01 | 2025-01-05 | Delivered   | 9833 Mt. Dias Blv. | 1226 Shoe St.  | 1        | 10    | 2025-01-01 12:34:56.0000000 |
| Orders        | 2       | 102       | 3          | 3             | 2025-01-05 | 2025-01-10 | Shipped     | 250 Race Court     | NULL           | 1        | 15    | 2025-01-05 23:22:04.0000000 |
| Orders        | 3       | 101       | 1          | 5             | 2025-01-10 | 2025-01-25 | Delivered   | 8157 W. Book       | 8157 W. Book   | 2        | 20    | 2025-01-10 18:24:08.0000000 |
| Orders        | 4       | 105       | 1          | 3             | 2025-01-20 | 2025-01-25 | Shipped     | 5724 Victory Lane  |                | 2        | 60    | 2025-01-20 05:50:33.0000000 |
| Orders        | 5       | 104       | 2          | 5             | 2025-02-01 | 2025-02-05 | Delivered   | NULL               | NULL           | 1        | 25    | 2025-02-01 14:02:41.0000000 |
| Orders        | 6       | 104       | 3          | 5             | 2025-02-05 | 2025-02-10 | Delivered   | 1792 Belmont Rd.   | NULL           | 2        | 50    | 2025-02-06 15:34:57.0000000 |
| Orders        | 7       | 102       | 1          | 1             | 2025-02-15 | 2025-02-27 | Delivered   | 136 Balboa Court   |                | 2        | 30    | 2025-02-16 06:22:01.0000000 |
| Orders        | 8       | 101       | 4          | 3             | 2025-02-18 | 2025-02-27 | Shipped     | 2947 Vine Lane     | 4311 Clay Rd   | 3        | 90    | 2025-02-18 10:45:22.0000000 |
| Orders        | 9       | 101       | 2          | 3             | 2025-03-10 | 2025-03-15 | Shipped     | 3768 Door Way      |                | 2        | 20    | 2025-03-10 12:59:04.0000000 |
| Orders        | 10      | 102       | 3          | 5             | 2025-03-15 | 2025-03-20 | Shipped     | NULL               | NULL           | 0        | 60    | 2025-03-16 23:25:15.0000000 |
| OrdersArchive | 1       | 101       | 2          | 3             | 2024-04-01 | 2024-04-05 | Shipped     | 123 Main St        | 456 Billing St | 1        | 10    | 2024-04-01 12:34:56.0000000 |
| OrdersArchive | 2       | 102       | 3          | 3             | 2024-04-05 | 2024-04-10 | Shipped     | 456 Elm St         | 789 Billing St | 1        | 15    | 2024-04-05 23:22:04.0000000 |
| OrdersArchive | 3       | 101       | 1          | 4             | 2024-04-10 | 2024-04-25 | Shipped     | 789 Maple St       | 789 Maple St   | 2        | 20    | 2024-04-10 18:24:08.0000000 |
| OrdersArchive | 4       | 105       | 1          | 3             | 2024-04-20 | 2024-04-25 | Delivered   | 987 Victory Lane   |                | 2        | 60    | 2024-04-20 14:50:33.0000000 |
| OrdersArchive | 4       | 105       | 1          | 3             | 2024-04-20 | 2024-04-25 | Shipped     | 987 Victory Lane   |                | 2        | 60    | 2024-04-20 05:50:33.0000000 |
| OrdersArchive | 5       | 104       | 2          | 5             | 2024-05-01 | 2024-05-05 | Shipped     | 345 Oak St         | 678 Pine St    | 1        | 25    | 2024-05-01 14:02:41.0000000 |
| OrdersArchive | 6       | 101       | 3          | 5             | 2024-05-05 | 2024-05-10 | Delivered   | 543 Belmont Rd.    | 3768 Door Way  | 2        | 50    | 2024-05-12 20:36:55.0000000 |
| OrdersArchive | 6       | 104       | 3          | 5             | 2024-05-05 | 2024-05-10 | Delivered   | 543 Belmont Rd.    | NULL           | 2        | 50    | 2024-05-06 15:34:57.0000000 |
| OrdersArchive | 6       | 104       | 3          | 5             | 2024-05-05 | 2024-05-10 | Delivered   | 543 Belmont Rd.    | 3768 Door Way  | 2        | 50    | 2024-05-07 13:22:05.0000000 |
| OrdersArchive | 7       | 102       | 3          | 5             | 2024-06-15 | 2024-06-20 | Shipped     | 111 Main St        | 222 Billing St | 0        | 60    | 2024-06-16 23:25:15.0000000 |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT 
	'Orders' AS SourceTable,
	OrderID,
	ProductID,
	CustomerID,
	SalesPersonID,
	OrderDate,
	ShipDate,
	OrderStatus,
	ShipAddress,
	BillAddress,
	Quantity,
	Sales,
	CreationTime
FROM Sales.Orders
UNION
SELECT
	'OrdersArchive' AS SourceTable,
	OrderID,
	ProductID,
	CustomerID,
	SalesPersonID,
	OrderDate,
	ShipDate,
	OrderStatus,
	ShipAddress,
	BillAddress,
	Quantity,
	Sales,
	CreationTime
FROM Sales.OrdersArchive
```
</details>
</p>

**Best practices**: Never use an asterisk to combine tables. List needed columns instead.

**Source flag**: include additional column to indicate the source of each row.


## 8. Use Case: Delta Detection
Delta detection is a method used by data engineers to identify new or changed records between consecutive data loads. By using the `EXCEPT` set operator, you can compare the current batch with the previous batch to isolate new data, avoiding duplicate inserts. This approach is essential in data pipelines for incremental loading into warehouses or data lakes. Additionally, it helps validate data completeness during migrations by checking for missing or extra records between source and target databases.

## 9. Set Operators Summary
Set operators in SQL combine results from multiple queries or tables into a single dataset. Key operators include `UNION` (combines rows without duplicates), `UNION ALL` (includes duplicates), `EXCEPT` (returns rows in the first query not in the second), and `INTERSECT` (returns common rows). Rules require queries to match in column count, data types, and column order, with the first query defining aliases. These operators are widely used for merging data (UNION, UNION ALL), comparing datasets (EXCEPT), and ensuring data quality in pipelines (EXCEPT).