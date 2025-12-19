# Section 3: Data Definition (DDL)


## 1. CREATE
The CREATE command is used to define new database objects, mainly tables.

With CREATE TABLE, you specify **columns**, **data types**, and **constraints** such as NOT NULL and PRIMARY KEY.

DDL commands modify the database structure and do not return result sets. New tables are created empty until data is inserted.

**SQL TASK:** Create a new table called persons with columns: id, person_name, birth_date and phone

```sql
CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birht_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY(id)
);
```

-> The previous query creates an empty table

```sql
SELECT * FROM persons;
```

**- Results:**

| id | person_name | birht_date | phone |
|----|-------------|------------|-------|


## 2. ALTER

The ALTER command modifies the structure of an existing table.
It allows adding or removing columns and changing definitions without recreating the table.

New columns are always added at the end of the table.

Dropping a column also removes all data stored in that column.

**SQL TASK:** Add a new column called email to the person table

```sql
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;
```

-> The previous query creates a new column at the end of an existing table

```sql
SELECT * FROM persons;
```
**- Results:**

| id | person_name | birht_date | phone | email |
|----|-------------|------------|-------|-------|


**SQL TASK:** Remove the column phone from the persons table

```sql
ALTER TABLE persons
DROP COLUMN phone;
```

-> The previous query drop a column of an existing table, and drop all the data inside this column

```sql
SELECT * FROM persons;
```
**- Results:**

| id | person_name | birht_date | email |
|----|-------------|------------|-------|


## 3. DROP

The DROP command permanently removes database objects like tables.

When a table is dropped, both its structure and data are deleted. This operation is irreversible and must be used with caution.

DROP is part of DDL because it changes the database schema.

**SQL TASK:** Delete the table persons from the database

```sql
DROP TABLE persons;
```