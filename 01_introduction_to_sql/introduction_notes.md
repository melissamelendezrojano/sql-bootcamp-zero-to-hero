# Section 1: Introduction to SQL

### 

### What is SQL and Databases

SQL (Structured Query Language) is used to communicate with databases, which are structured containers designed to store, organize and manage large volumens of data efficiently.

Unlike files or spreadsheets, databases allow fast querying, scalability, and secure access control.

Using SQL, users can ask questions to the databasae and receive results in a simple and efficient way.



### What is DBMS and SQL Server

A DBMS (Database Management System) is the software that manages access to a database, handling multiple SQL requests, execution order, security and permissions.

SQL Server is a DBMS that runs on a server (physical or cloud), providing a reliable, always-on environment where databases are stored and accessed by users, applicatons and tools.



### Types of Databases

Databases can be classified based on how data is structured and accessed. The most common type used in companies is the relational database, but there are several other models designed for specific use cases.



\*\*Main Types\*\*



1\. \*\*Relational Database (SQL)\*\*  

&nbsp;  - Stores data in tables (rows \& columns)  

&nbsp;  - Relationships define connections between tables  

&nbsp;  - Examples: Microsoft SQL Server, MySQL, PostgreSQL  



2\. \*\*NoSQL Databases\*\* – flexible and non-relational:



&nbsp;  - \*\*Key-Value\*\*: data stored as pairs (like a dictionary)  

&nbsp;    - Examples: Redis, Amazon DynamoDB  



&nbsp;  - \*\*Column-Based\*\*: data grouped by columns for fast searches on large datasets  

&nbsp;    - Examples: Cassandra, Amazon Redshift  



&nbsp;  - \*\*Graph\*\*: focuses on relationships between data points. Ideal for connected data such as social networks or recommendation systems.  

&nbsp;    - Examples: Neo4j  



&nbsp;  - \*\*Document\*\*: stores entire documents, structure is flexible  

&nbsp;    - Examples: MongoDB  



###### SQL vs NoSQL Overview

```plaintext
SQL Databases
│
└── Relational (Tables + Relationships)

NoSQL Databases
│
├── Key-Value
├── Column-Based
├── Graph
└── Document

````





### Types of SQL Commands

SQL commands are grouped into three main categories:



1\. \*\*Data Definition Language (DDL)\*\* – defines and manages database structure.

&nbsp;  - `CREATE` → create tables or objects

&nbsp;  - `ALTER` → modify existing objects

&nbsp;  - `DROP` → delete tables or objects



2\. \*\*Data Manipulation Language (DML)\*\* – manipulates data inside tables.

&nbsp;  - `INSERT` → add new data

&nbsp;  - `UPDATE` → modify existing data

&nbsp;  - `DELETE` → remove data



3\. \*\*Data Query Language (DQL)\*\* – queries and retrieves data.

&nbsp;  - `SELECT` → retrieve data for analysis or reporting



\*\*Summary Diagram:\*\*

```plaintext

SQL Commands

│

├── DDL (Structure) → CREATE, ALTER, DROP

├── DML (Data) → INSERT, UPDATE, DELETE

└── DQL (Query) → SELECT

````



### Why learn SQL

\# Why Learn SQL



SQL is the standard language to communicate with databases, which are widely used in companies.  



\*\*Key Reasons to Learn SQL\*\*



1\. \*\*Communicate with Data\*\*  

&nbsp;  - Databases store most company data; SQL is the language to access and manipulate it.



2\. \*\*High Demand Skill\*\*  

&nbsp;  - SQL is required in job descriptions for data analysts, data engineers, data scientists, and software developers.



3\. \*\*Industry Standard\*\*  

&nbsp;  - Most modern data platforms and tools (Power BI, Tableau, Spark, Synapse) use SQL for queries and integration.









