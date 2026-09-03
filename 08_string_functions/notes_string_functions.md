# Section 8: String Functions

## 1. INTRO: WHAT IS DATA TRANSFORMATION
Data transformation is the process of cleaning and preparing messy data before analysis. In real-world projects, data often has inconsistencies, numbers stored as strings, incorrect date formats, and missing values. SQL provides tools like string, number, and date functions, along with case statements, to standardize and prepare data. Proper transformation ensures accurate analysis results.

## 2. SQL FUNCTIONS
SQL functions are built-in operations that accept input values, process them, and return output values. They are divided into single-row functions (one input → one output) and multi-row functions (multiple inputs → single output, e.g., SUM). Functions can be nested for sequential transformations, and subcategories include string, numeric, date, null-handling, aggregate, and window functions. Single-row functions are often used by data engineers, while analysts rely heavily on multi-row functions.

## 3. CONCAT
The CONCAT function combines multiple string values into one. For example, first and last names stored in separate columns can be merged into a single value like "Michael Scott". CONCAT allows adding separators such as spaces, dashes, or underscores. It is a fundamental string manipulation tool to create unified, readable outputs from separate data fields.

**SQL TASK**: Concatenate first name and country into one column

<details>
	<summary> Click to expand expected results.</summary>

| first_name | country | name_country   |
|------------|---------|----------------|
| Maria      | Germany | Maria-Germany  |
|  John      | USA     |  John-USA      |
| Georg      | UK      | Georg-UK       |
| Martin     | Germany | Martin-Germany |
| Peter      | USA     | Peter-USA      |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT 
	first_name,
	country,
	CONCAT(first_name, '-', country) AS name_country
FROM customers;
```
</details>
</p>

## 4. UPPER & LOWER
UPPER converts all characters in a string to uppercase, while LOWER converts all characters to lowercase. These functions standardize text case for consistency in reporting or analysis. They are simple yet powerful for transforming text data, ensuring that variations in capitalization do not affect comparisons or grouping.

**SQL TASK**: Convert the first name to lowercase, and to uppercase

<details>
	<summary> Click to expand expected results.</summary>

| first_name | name_low | name_up |
|------------|----------|---------|
| Maria      | maria    | MARIA   |
|  John      |  john    |  JOHN   |
| Georg      | georg    | GEORG   |
| Martin     | martin   | MARTIN  |
| Peter      | peter    | PETER   |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
SELECT
	first_name,
	LOWER(first_name) AS name_low,
	UPPER(first_name) AS name_up
FROM customers;
```
</details>
</p>


## 5. TRIM
TRIM removes leading and trailing spaces from string values, including multiple consecutive spaces. It helps detect and clean unwanted whitespace that can distort analysis, such as incorrect string lengths or mismatched comparisons. TRIM can be combined with other functions like LENGTH to identify and flag problematic entries efficiently.

**SQL TASK**: Find customers whose first name contains leading or trailing spaces

<details>
	<summary> Click to expand expected results.</summary>

| first_name | len_name | len_trim_name | flag |
|------------|----------|---------------|------|
|  John      | 5        | 4             | 1    |

</details>

<details>
	<summary> Click to expand answer.</summary>

```sql
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
```
</details>
</p>


## 6. REPLACE
The REPLACE function substitutes a specified character or substring with a new value in a string. It can also remove characters by replacing them with nothing. Common use cases include formatting phone numbers or changing file extensions. This function is essential for cleaning and standardizing string data.

<details>
	<summary> Click to expand expected results.</summary>



</details>

<details>
	<summary> Click to expand answer.</summary>

```sql

```
</details>
</p>


## 7. LEN
The LEN function calculates the number of characters in a value, including letters, numbers, and symbols. It works on strings, numbers, and even date values. This function is useful for validating data length, detecting inconsistencies, or preparing dynamic extractions from strings.

<details>
	<summary> Click to expand expected results.</summary>



</details>

<details>
	<summary> Click to expand answer.</summary>

```sql

```
</details>
</p>


## 8. LEFT & RIGHT
LEFT extracts a specified number of characters from the start of a string, while RIGHT extracts from the end. Both require the target value and the number of characters to extract. These functions are helpful for retrieving prefixes, suffixes, or structured segments of string data.

## 9. SUBSTRING
SUBSTRING extracts a portion of a string starting at a defined position for a specified length. Unlike LEFT or RIGHT, it allows extraction from the middle of a value. Combining SUBSTRING with functions like LEN and TRIM enables dynamic and precise extraction in varying data scenarios.

## 10. NUMBER FUNCTIONS
SQL numeric functions like ROUND and ABS transform numerical data. ROUND adjusts numbers to a specified number of decimal places, rounding up or down as needed. ABS converts negative numbers to positive, useful for correcting data inconsistencies or preparing data for analysis.

## 11. NUMBER FUNCTIONS
SQL provides functions to manipulate numeric values, including ROUND and ABS. ROUND adjusts a number to a specified number of decimal places, rounding up or down based on standard rules. ABS converts any negative number to a positive, which is useful for correcting data inconsistencies or preparing data for analysis. These functions simplify numerical transformations and ensure data accuracy.