-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

-- GET PRODUCT NAME AND CATEGORY NAME FROM THE CATEGORY TABLE
-- JOIN THE PRODUCT TABLE AND CATEGORY TABLE ON THE CONDITION THAT CATEGORY ID = PRODUCT TABLE'S CATEGORY ID
-- CATEGORY.ID IS THE PRIMARY KEY WHILE PRODUCT.CATEGORYID IS THE FOREIGN KEY
-- PREFERRED SYNTAX: TAKE FROM THE PRIMARY TABLE (TABLE WITH PRIMARY KEY) THEN JOIN SECONDARY TABLE
SELECT ProductName, CategoryName FROM Category
JOIN Product ON Category.Id = Product.CategoryId;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT [Order].Id AS 'Order Id', Shipper.CompanyName AS 'Company Name' FROM Shipper
JOIN [Order] ON Shipper.Id = [Order].ShipVia
WHERE [Order].OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT ProductName AS 'Product Name', Quantity FROM OrderDetail
JOIN Product On OrderDetail.ProductId = Product.Id
WHERE OrderId = 10251
ORDER BY ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

create view vCompany AS
SELECT [Order].Id AS 'OrderId', CompanyName AS 'CustomerCompanyName' FROM [Order]
JOIN Customer ON [Order].CustomerId = Customer.Id;

create view vEmployee AS
SELECT [Order].Id AS 'OrderId', LastName AS 'EmployeeLastName' FROM [Order]
JOIN Employee ON [Order].EmployeeId = Employee.Id;

SELECT * FROM vCompany;
SELECT * FROM vEmployee;

SELECT OrderId AS 'Order Id', EmployeeLastName AS 'Employee Last Name', CustomerCompanyName AS 'Customer Company Name' FROM vEmployee
JOIN vCompany ON vEmployee.OrderId = vCompany.OrderId