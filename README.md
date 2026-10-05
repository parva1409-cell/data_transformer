# 🗄️ DataTransformerDB

DataTransformerDB is a beginner-friendly **MySQL project** created to practice data transformation, retrieval, and analysis using SQL.

The project works with **customers, orders, and employees** and demonstrates different SQL techniques such as JOINs, subqueries, date functions, string functions, window functions, and conditional logic.

## 📌 Project Overview

The database is named **DataTransformerDB**.

It contains three main tables:

### 👤 1. Customers

The `Customers` table stores customer information such as:

- Customer ID
- First name
- Last name
- Email
- Registration date

`CustomerID` is the **Primary Key** and automatically increases for each new customer.

### 🛒 2. Orders

The `Orders` table stores information about customer orders.

It contains:

- Order ID
- Customer ID
- Order date
- Total order amount

`CustomerID` is a **Foreign Key** that connects orders with customers. The relationship uses `ON DELETE SET NULL`, meaning the customer reference becomes `NULL` if the related customer is deleted.

### 👨‍💼 3. Employees

The `Employees` table stores employee information, including:

- Employee ID
- First name
- Last name
- Department
- Hire date
- Salary

`EmployeeID` is the **Primary Key** of the table.

## 🔗 Table Relationship

The main relationship in the project is between `Customers` and `Orders`.

```text
Customers
    │
    │ CustomerID
    ▼
 Orders
```

A customer can have multiple orders, while an order can be associated with a customer.

The project also includes an order with a `NULL` customer ID to demonstrate how JOINs handle orders without a matching customer.

## 📊 SQL Queries and Explanations

The project contains **17 queries**, each demonstrating a different SQL concept.

### 1️⃣ INNER JOIN

The `INNER JOIN` displays orders that have a matching customer.

It combines information from the `Customers` and `Orders` tables using `CustomerID`.

**Purpose:** To retrieve only records that have a match in both tables.

### 2️⃣ LEFT JOIN

The `LEFT JOIN` displays all customers and their orders when a matching order exists.

**Purpose:** To keep every customer in the result, even if they do not have an order.

### 3️⃣ RIGHT JOIN

The `RIGHT JOIN` displays all orders and the customer information when a matching customer exists.

**Purpose:** To keep every order in the result, including orders without a matching customer.

### 4️⃣ FULL OUTER JOIN

MySQL does not directly provide a `FULL OUTER JOIN`, so the project creates a similar result by combining a `LEFT JOIN` and `RIGHT JOIN` using `UNION`.

**Purpose:** To include matching and non-matching records from both tables.

### 5️⃣ Subquery – Orders Above Average

This query finds orders where the `TotalAmount` is greater than the average order amount.

The average is calculated using a subquery with `AVG()`.

**Purpose:** To compare individual orders against the overall average.

### 6️⃣ Subquery – Employees Above Average Salary

This query finds employees whose salary is higher than the average employee salary.

**Purpose:** To identify employees earning above the overall salary average.

## 📅 Date Functions

### 7️⃣ Extract Year and Month

The `YEAR()` and `MONTH()` functions are used to extract the year and month from `OrderDate`.

**Purpose:** To break a date into individual year and month values for analysis.

### 8️⃣ Calculate Days Since Order

The `DATEDIFF()` function calculates the difference between the current date and the order date.

**Purpose:** To determine how many days have passed since an order was placed.

### 9️⃣ Format Order Date

The `DATE_FORMAT()` function changes the display format of `OrderDate` to `DD-MMM-YYYY`.

**Purpose:** To display dates in a more readable format.

## 🔤 String Functions

### 🔟 CONCAT()

The `CONCAT()` function combines the customer's first name and last name into a single `FullName`.

**Purpose:** To create a complete name from two separate columns.

### 1️⃣1️⃣ REPLACE()

The `REPLACE()` function replaces the name `John` with `Jonathan`.

**Purpose:** To demonstrate how text values can be replaced within query results.

### 1️⃣2️⃣ UPPER() and LOWER()

`UPPER()` converts the first name to uppercase, while `LOWER()` converts the last name to lowercase.

**Purpose:** To demonstrate changing the case of text data.

### 1️⃣3️⃣ TRIM()

The `TRIM()` function removes surrounding whitespace from email addresses.

**Purpose:** To clean unnecessary spaces from text data.

## 📈 Window Functions

### 1️⃣4️⃣ Running Total

The `SUM()` window function calculates a running total of order amounts based on the order date.

**Purpose:** To see how the total order amount accumulates over time.

### 1️⃣5️⃣ Ranking Orders

The `RANK()` window function ranks orders according to their total amount, from highest to lowest.

**Purpose:** To identify the relative position of each order based on its amount.

## 🏷️ CASE Statements

### 1️⃣6️⃣ Order Discount Tier

The `CASE` statement assigns a discount category based on the order amount:

| Order Amount | Discount |
|---|---|
| More than 1000 | 10% Discount |
| More than 500 | 5% Discount |
| 500 or less | No Discount |

**Purpose:** To demonstrate conditional logic in SQL.

### 1️⃣7️⃣ Employee Salary Category

The `CASE` statement categorizes employee salaries into three levels:

| Salary | Category |
|---|---|
| 70000 or more | High |
| 52000 or more | Medium |
| Below 52000 | Low |

**Purpose:** To classify data based on specific conditions.

## 🧮 SQL Concepts Practiced

This project covers:

- 🗃️ Database and table creation
- 🔑 Primary Keys
- 🔗 Foreign Keys
- 🔄 `INNER JOIN`
- ⬅️ `LEFT JOIN`
- ➡️ `RIGHT JOIN`
- 🔀 `UNION`
- 🔍 Subqueries
- 📅 Date functions
- 🔤 String functions
- 📈 Window functions
- 🏆 Ranking
- ➕ Running totals
- 🏷️ `CASE` statements
- 📊 Aggregate functions

## 🎯 Project Objectives

The main objectives of this project are:

- To understand relationships between database tables.
- To practice different types of JOINs.
- To learn how subqueries work.
- To perform basic data transformation using SQL functions.
- To work with dates and text values.
- To understand window functions.
- To use conditional logic with `CASE`.
- To perform basic analysis on customer, order, and employee data.

## 🚀 How to Run

1. Install **MySQL** on your computer.
2. Open MySQL Workbench, VS Code with a MySQL extension, or another MySQL-compatible environment.
3. Open `data_transformer.sql`.
4. Connect to your MySQL server.
5. Run the complete SQL script.
6. The `DataTransformerDB` database and its tables will be created.
7. Run the queries to view the results of each SQL operation.

## 📁 Project Structure

```text
DataTransformerDB/
│
├── data_transformer.sql
└── README.md
```

## 🛠️ Technologies Used

- 🐬 **MySQL**
- 🗃️ **SQL**

## 🎓 Learning Outcome

Through this project, I practiced advanced SQL concepts beyond basic CRUD operations, including table joins, subqueries, data transformation functions, window functions, ranking, running totals, and conditional data categorization.
