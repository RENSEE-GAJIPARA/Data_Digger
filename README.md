# 🗄️ Data Digger — E-Commerce SQL Project

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![License](https://img.shields.io/badge/License-Academic-orange)

---

## 📌 Project Overview

**Data Digger** is a hands-on MySQL project designed to build practical experience in managing a relational database using core SQL concepts. The project simulates a real-world **E-Commerce Store** database with four interrelated tables and covers **CRUD operations**, **aggregate functions**, **clauses**, **operators**, **primary keys**, and **foreign keys**.

---

## 🎯 Objective

> Design, populate, and query a structured relational database for an E-Commerce Store to gain deeper insights into SQL query execution and database management.

---

## 🗂️ Database Schema

```
DataDigger
├── Customers       (CustomerID, Name, Email, Address)
├── Orders          (OrderID, CustomerID*, OrderDate, TotalAmount)
├── Products        (ProductID, ProductName, Price, Stock)
└── OrderDetails    (OrderDetailID, OrderID*, ProductID*, Quantity, SubTotal)

* Foreign Key
```

### Entity Relationship Diagram

```
Customers ──────< Orders ──────< OrderDetails >────── Products
(CustomerID PK)   (CustomerID FK)  (OrderID FK)        (ProductID PK)
                  (OrderID PK)     (ProductID FK)
```

---

## 📋 Table Structure

### 1. Customers Table
| Column | Type | Constraint |
|---|---|---|
| CustomerID | INT | PRIMARY KEY, AUTO_INCREMENT |
| Name | VARCHAR(100) | NOT NULL |
| Email | VARCHAR(150) | UNIQUE, NOT NULL |
| Address | VARCHAR(255) | — |

### 2. Orders Table
| Column | Type | Constraint |
|---|---|---|
| OrderID | INT | PRIMARY KEY, AUTO_INCREMENT |
| CustomerID | INT | FOREIGN KEY → Customers |
| OrderDate | DATE | NOT NULL |
| TotalAmount | DECIMAL(10,2) | NOT NULL |

### 3. Products Table
| Column | Type | Constraint |
|---|---|---|
| ProductID | INT | PRIMARY KEY, AUTO_INCREMENT |
| ProductName | VARCHAR(150) | NOT NULL |
| Price | DECIMAL(10,2) | NOT NULL |
| Stock | INT | DEFAULT 0 |

### 4. OrderDetails Table
| Column | Type | Constraint |
|---|---|---|
| OrderDetailID | INT | PRIMARY KEY, AUTO_INCREMENT |
| OrderID | INT | FOREIGN KEY → Orders |
| ProductID | INT | FOREIGN KEY → Products |
| Quantity | INT | NOT NULL |
| SubTotal | DECIMAL(10,2) | NOT NULL |

---

## ⚙️ Setup Instructions

### Prerequisites
- MySQL 8.0+ installed
- MySQL Workbench or any SQL client

### Steps to Run

```bash
# 1. Open MySQL Workbench or terminal
mysql -u root -p

# 2. Run the SQL script
source data_digger.sql;

# 3. Verify the database
SHOW DATABASES;
USE DataDigger;
SHOW TABLES;
```

---

## 📊 Query Outputs

---

### 🔷 Table 1 — Customers

#### ✅ Insert 5+ Sample Customers
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Retrieve All Customers
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Update a Customer's Address
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Delete a Customer by CustomerID
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Display All Customers Named 'Alice'
<!-- INSERT SCREENSHOT HERE -->

---

### 🔷 Table 2 — Orders

#### ✅ Insert 5+ Sample Orders
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Retrieve All Orders by a Specific Customer
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Update an Order's Total Amount
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Delete an Order by OrderID
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Retrieve Orders Placed in the Last 30 Days
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Highest, Lowest & Average Order Amount
<!-- INSERT SCREENSHOT HERE -->

---

### 🔷 Table 3 — Products

#### ✅ Insert 5+ Sample Products
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Retrieve All Products Sorted by Price (Descending)
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Update Price of a Specific Product
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Delete Out-of-Stock Products
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Retrieve Products Priced Between ₹500 and ₹2000
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Most Expensive & Cheapest Product
<!-- INSERT SCREENSHOT HERE -->

---

### 🔷 Table 4 — OrderDetails

#### ✅ Insert 5+ Sample Records
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Retrieve All Details for a Specific Order
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Total Revenue from All Orders
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Top 3 Most Ordered Products
<!-- INSERT SCREENSHOT HERE -->

---

#### ✅ Count How Many Times a Product Has Been Sold
<!-- INSERT SCREENSHOT HERE -->

---

## 🧠 Concepts Covered

| Concept | Used In |
|---|---|
| `CREATE TABLE` | All 4 tables |
| `PRIMARY KEY` / `AUTO_INCREMENT` | All 4 tables |
| `FOREIGN KEY` | Orders, OrderDetails |
| `INSERT INTO` | All 4 tables |
| `SELECT` / `SELECT *` | All tables |
| `UPDATE … SET … WHERE` | Customers, Orders, Products |
| `DELETE … WHERE` | Customers, Orders, Products |
| `WHERE` / `LIKE` / `BETWEEN` | Customers, Products |
| `ORDER BY` | Products |
| `LIMIT` | OrderDetails |
| `JOIN` | OrderDetails ↔ Products |
| `GROUP BY` | OrderDetails |
| `MAX()`, `MIN()`, `AVG()` | Orders, Products |
| `SUM()`, `COUNT()` | OrderDetails |
| `CURDATE()`, `INTERVAL` | Orders |

---

## 👤 Author

**Name:** _(Your Name)_
**Course:** _(Your Course / Subject Name)_
**Institution:** _(Your College / University)_
**Date:** April 2026

---

## 📝 License

This project is submitted as part of an academic assignment. All SQL scripts are original work created for educational purposes.
