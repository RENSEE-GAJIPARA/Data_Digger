CREATE DATABASE DataDigger;
USE DataDigger;

-- 1. CUSTOMERS TABLE
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- Insert sample customers
INSERT INTO Customers (Name, Email, Address) VALUES
('Alice Sharma', 'alice@example.com', '12, MG Road, Mumbai'),
('Bob Mehta', 'bob@example.com', '45, Park Street, Delhi'),
('Charlie Nair', 'charlie@example.com', '78, Anna Salai, Chennai'),
('Diana Kapoor', 'diana@example.com', '23, FC Road, Pune'),
('Edward Iyer', 'edward@example.com', '56, Brigade Road, Bangalore'),
('Alice Fernandes','alicef@example.com', '99, Hill Road, Goa');

-- Retrieve all customer details
SELECT * FROM Customers;

-- Update a customer's address
UPDATE Customers SET Address='10, Lal Darwaja, Ahemdabad' WHERE CustomerID=1;

-- Delete a customer using their CustomerID
DELETE FROM Customers WHERE CustomerID=6;

-- Display all customers whose name is 'Alice'
SELECT * FROM Customers WHERE Name LIKE 'Alice%';


-- 2. ORDERS TABLE
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-01-15', 1500.00),
(2, '2026-02-10', 3200.50),
(3, '2026-03-05', 750.00),
(4, '2026-04-01', 4800.00),
(5, '2026-05-20', 999.99),
(1, '2026-06-30', 2200.00);

-- Retrieve all orders made by a specific customer
SELECT * FROM Orders WHERE CustomerID=1;

-- Update an order's total amount
UPDATE Orders SET TotalAmount=1800 WHERE OrderID=1;

-- Delete an order using its OrderID
DELETE FROM Orders WHERE OrderID=6;

-- Retrieve orders placed in the last 30 days
SELECT * FROM Orders WHERE OrderDate<'2026-04-01' AND OrderDate>='2026-03-01';

-- Highest, lowest, and average order amount
SELECT MAX(TotalAmount) AS HighestOrder, 
MIN(TotalAmount) AS LowestOrder, 
AVG(TotalAmount) AS AverageOrder 
FROM Orders;


-- 3. PRODUCTS TABLE
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0
);

-- Insert sample products
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Wireless Mouse', 499.00, 50),
('Mechanical Keyboard', 1999.00, 30),
('USB-C Hub', 1299.00, 20),
('Laptop Stand', 799.00, 15),
('Webcam HD', 2499.00, 0),
('Noise-Cancel Headset', 3499.00, 10);

-- Retrieve all products sorted by price in descending order
SELECT * FROM Products ORDER BY Price DESC;

-- Update the price of a specific product
UPDATE Products SET Price=1199 WHERE ProductID=4;

-- Delete a product if it's out of stock
DELETE FROM Products WHERE Stock=0;

-- Retrieve products whose price is between ₹500 and ₹2000
SELECT * FROM Products WHERE Price>=500 AND Price<=2000;

-- Most expensive and cheapest product using MAX() and MIN()
SELECT MAX(Price) AS MostExpensive, MIN(Price) AS MostCheapest FROM Products;


-- 4. ORDER DETAILS TABLE
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    SubTotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample records
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 2, 998.00),
(1, 2, 1, 1899.00),
(2, 3, 1, 1299.00),
(2, 4, 2, 1598.00),
(3, 1, 3, 1497.00),
(4, 6, 1, 3499.00),
(5, 4, 1, 799.00);

-- Retrieve all order details for a specific order
SELECT od.*, p.ProductName 
FROM OrderDetails od 
JOIN Products p ON od.ProductID = p.ProductID 
WHERE od.OrderID=1;

-- Total revenue generated from all orders using SUM()
SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;

-- Top 3 most ordered products
SELECT p.ProductName,
SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY od.ProductID, p.ProductID
ORDER BY TotalQuantitySold DESC
LIMIT 3;

-- Count how many times a specific product has been sold
SELECT p.ProductName,
COUNT(od.OrderDetailID) AS TimesSold,
SUM(od.Quantity) AS TotalUnitsSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE od.ProductID = 1
GROUP BY p.ProductName;