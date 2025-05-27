CREATE SCHEMA company; 

CREATE TABLE company.employees (
    EmployeeID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR (100), 
    LastName VARCHAR(100),
    Gender VARCHAR(20),
    Department VARCHAR(50), 
    HireDate DATE, 
    Salary DECIMAL(10,2)
    );

CREATE TABLE company.products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    Price NUMERIC(10, 2),
    Stock INT
);
CREATE TABLE company.sales(
    SaleId VARCHAR(10) PRIMARY KEY, 
    ProductID VARCHAR REFERENCES company.products(ProductID),
    EmployeeID VARCHAR REFERENCES company.employees(EmployeeID),
    SaleDate DATE,
    Quantity INT,
    Total DECIMAL (10,2)
);

INSERT INTO company.employees(EmployeeID, FirstName, LastName, Gender, Department, HireDate, Salary) VALUES
(1, 'John', 'Doe', 'Male', 'IT', '2018-05-01', 60000.00),
(2, 'Jane', 'Smith', 'Female', 'HR', '2019-06-15', 50000.00),
(3, 'Michael', 'Johnson', 'Male', 'Finance', '2017-03-10', 75000.00),
(4, 'Emily', 'Davis', 'Female', 'IT', '2020-11-20', 70000.00),
(5, 'Sarah', 'Brown', 'Female', 'Marketing', '2016-07-30', 45000.00),
(6, 'David', 'Wilson', 'Male', 'Sales', '2019-01-05', 55000.00),
(7, 'Chris', 'Taylor', 'Male', 'IT', '2022-02-25', 65000.00);


INSERT INTO company.products(ProductID, ProductName, Category, Price, Stock)VALUES
(1, 'Laptop', 'Electronics', 1200.00, 30),
(2, 'Desk', 'Furniture', 300.00, 50),
(3, 'Chair', 'Furniture', 150.00, 200),
(4, 'Smartphone', 'Electronics', 800.00, 75),
(5, 'Monitor', 'Electronics', 250.00, 40),
(6, 'Bookshelf', 'Furniture', 100.00, 60),
(7, 'Printer', 'Electronics', 200.00, 25);

INSERT INTO company.sales(SaleId, productID, employeeID, SaleDate, Quantity,Total )VALUES
(1, 1, 1, '2021-01-15', 2, 2400.00),
(2, 2, 2, '2021-03-22', 1, 300.00),
(3, 3, 3, '2021-05-10', 4, 600.00),
(4, 4, 4, '2021-07-18', 3, 2400.00),
(5, 5, 5, '2021-09-25', 2, 500.00),
(6, 6, 6, '2021-11-30', 1, 100.00),
(7, 7, 1, '2022-02-15', 1, 200.00),
(8, 1, 2, '2022-04-10', 1, 1200.00),
(9, 2, 3, '2022-06-20', 2, 600.00),
(10, 3, 4, '2022-08-05', 3, 450.00),
(11, 4, 5, '2022-10-11', 1, 800.00),
(12, 5, 6, '2022-12-29', 4, 1000.00);

-- 1. Select all columns from the Employees table. 
SELECT * FROM company.employees;

-- 2. Select the first names of all employees. 
SELECT FirstName FROM company.employees;

-- 3. Select distinct departments from the Employees table. 
SELECT DISTINCT Department FROM company.employees;

-- 4. Select the total number of employees. 
SELECT COUNT(EmployeeID) FROM company.employees;

-- 5. Select the total salary paid to all employees. 
SELECT SUM(Salary) FROM company.employees;

-- 6. Select the average salary of all employees. 
SELECT AVG(Salary) FROM company.employees;

-- 7. Select the highest salary in the Employees table. 
SELECT MAX(Salary) FROM company.employees;

-- 8. Select the lowest salary in the Employees table. 
SELECT MIN(Salary) FROM company.employees;

-- 9. Select the total number of male employees. 
SELECT COUNT(Gender) FROM company.employees WHERE Gender='Male';

-- 10. Select the total number of Female employees. 
SELECT COUNT(Gender) FROM company.employees WHERE Gender='Female';

-- 11. Select the total number of employees hired in the year 2020. 
SELECT COUNT(EmployeeID) FROM company.employees WHERE HireDate BETWEEN '2020-01-01' AND '2020-12-31' ;

-- 12. Select the average salary of employees in the 'IT' department. 
SELECT AVG(Salary) FROM company.employees WHERE Department = 'IT';

-- 13. Select the number of employees in each department. 

SELECT COUNT(EmployeeID), Department FROM company.employees 
GROUP BY Department; 

-- 14. Select the total salary paid to employees in each department. 
SELECT SUM(Salary), Department FROM company.employees 
GROUP BY Department; 

-- 15. Select the maximum salary in each department. 
SELECT MAX(Salary), Department FROM company.employees 
GROUP BY Department; 

-- 16. Select the minimum salary in each department. 
SELECT MIN(Salary), Department FROM company.employees 
GROUP BY Department; 

-- 17. Select the total number of employees, grouped by gender. 
SELECT COUNT(Gender),Gender FROM company.employees 
GROUP BY Gender;

-- 18. Select the average salary of employees, grouped by gender. 

SELECT AVG(Salary), Gender FROM company.employees
GROUP BY Gender;


-- 19. Select the top 5 highest-paid employees. 
SELECT EmployeeID, Salary FROM company.employees 
ORDER BY Salary DESC;

-- 20. Select the total number of unique first names in the Employees table. 

SELECT DISTINCT FirstName FROM company.employees;

-- 21. Select all employees and their corresponding sales 
SELECT FirstName, LastName, ProductName, Total FROM company.employees, company.products, company.sales
WHERE EmployeeID = ProductID AND EmployeeID= saleID; 

-- 22. Select the first 10 employees hired, ordered by their HireDate.
SELECT * FROM Employees ORDER BY HireDate
LIMIT 10;

-- 23. Select the employees who have not made any sales. 

SELECT * FROM company.sales WHERE Total=NULL;

-- 24. Select the total number of sales made by each employee. 

SELECT COUNT(Total), EmployeeID
FROM company.sales
GROUP BY(EmployeeID);

-- 25. Select the employee who made the highest total sales. 
