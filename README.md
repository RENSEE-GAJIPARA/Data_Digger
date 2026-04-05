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
## 👨‍💻 Author

<div align="center">

**Rensee Gajipara**

[![GitHub](https://img.shields.io/badge/GitHub-RENSEE--GAJIPARA-181717?style=for-the-badge&logo=github)](https://github.com/RENSEE-GAJIPARA)

</div>
