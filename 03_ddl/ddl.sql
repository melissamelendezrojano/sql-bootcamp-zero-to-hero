-- CREATE:

-- SQL TASK: Create a new table called persons with columns: id, person_name, birth_date and phone

CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birht_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY(id)
);

-- The previous query creates an empty table

SELECT * FROM persons;

-- Results:
/*
+----+-------------+------------+-------+
| id | person_name | birht_date | phone |
+----+-------------+------------+-------+
*/


-- ALTER:

-- SQL TASK: Add a new column called email to the person table

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;

-- The previous query creates a new column at the end of an existing table

SELECT * FROM persons;

-- Results:
/*
+----+-------------+------------+-------+-------+
| id | person_name | birht_date | phone | email |
+----+-------------+------------+-------+-------+
*/


-- SQL TASK: Remove the column phone from the persons table

ALTER TABLE persons
DROP COLUMN phone;

-- The previous query drop a column of an existing table, and drop all the data inside this column

SELECT * FROM persons;

-- Results:
/*
+----+-------------+------------+-------+
| id | person_name | birht_date | email |
+----+-------------+------------+-------+
*/


-- DELETE:

-- SQL TASK: Delete the table persons from the database

DROP TABLE persons;