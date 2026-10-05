CREATE DATABASE IF NOT EXISTS DataTransformerDB;
USE DataTransformerDB;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    RegistrationDate DATE NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE SET NULL
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);


INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES
('John', 'Doe', 'john.doe@email.com ', '2022-03-15'),
('Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
('Robert', 'Johnson', 'robert.j@email.com', '2023-01-10');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-10', 600.00),
(104, NULL, '2023-07-15', 1200.00);

INSERT INTO Employees (FirstName, LastName, Department, HireDate, Salary) VALUES
('Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
('Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
('David', 'Miller', 'IT', '2019-05-12', 75000.00);


-- Query 1: INNER JOIN
SELECT Orders.OrderID, Customers.FirstName, Customers.LastName, Orders.OrderDate, Orders.TotalAmount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Query 2: LEFT JOIN 
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Orders.OrderID, Orders.TotalAmount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Query 3: RIGHT JOIN
SELECT Orders.OrderID, Orders.TotalAmount, Customers.FirstName, Customers.LastName
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Query 4: FULL OUTER JOIN
SELECT Customers.CustomerID, Customers.FirstName, Orders.OrderID, Orders.TotalAmount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerID, Customers.FirstName, Orders.OrderID, Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Query 5: Subquery - Customers with orders higher than average
SELECT CustomerID, OrderID, TotalAmount 
FROM Orders 
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);

-- Query 6: Subquery - Employees earning above average salary
SELECT EmployeeID, FirstName, LastName, Salary 
FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Query 7: Extract Year and Month from OrderDate
SELECT OrderID, OrderDate, YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth 
FROM Orders;

-- Query 8: Calculate difference in days between order date and current date
SELECT OrderID, OrderDate, DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder 
FROM Orders;

-- Query 9: Format OrderDate to 'DD-MMM-YYYY'
SELECT OrderID, DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate 
FROM Orders;

-- Query 10: Concatenate FirstName and LastName into full name
SELECT CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName 
FROM Customers;

-- Query 11: Replace 'John' with 'Jonathan'
SELECT CustomerID, REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName 
FROM Customers;

-- Query 12: Upper-case FirstName and Lower-case LastName
SELECT UPPER(FirstName) AS UpperFirstName, LOWER(LastName) AS LowerLastName 
FROM Customers;

-- Query 13: Trim surrounding whitespace from Email
SELECT CustomerID, TRIM(Email) AS CleanEmail 
FROM Customers;

-- Query 14: Running total of TotalAmount ordered by Date
SELECT OrderID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;

-- Query 15: Rank orders by TotalAmount
SELECT OrderID, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
FROM Orders;

-- Query 16: Assign discount tier using CASE
SELECT OrderID, TotalAmount,
       CASE 
           WHEN TotalAmount > 1000 THEN '10% Discount'
           WHEN TotalAmount > 500 THEN '5% Discount'
           ELSE 'No Discount'
       END AS Discount_Tier
FROM Orders ;

-- Query 17: Categorize employee salaries using CASE
SELECT EmployeeID, FirstName, LastName, Salary,
       CASE 
           WHEN Salary >= 70000 THEN 'High'
           WHEN Salary >= 52000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM Employees;