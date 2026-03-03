# 📊 Power BI E-Commerce Sales Dashboard

> End-to-End Business Intelligence Project using SQL Server & Power BI

---

## 🚀 Project Overview

This project demonstrates a complete Business Intelligence workflow:

- Data creation in **Microsoft SQL Server**
- Data transformation & modeling in **Power BI**
- DAX measure development
- Interactive dashboard design

The objective is to analyze e-commerce sales performance and generate meaningful business insights.

---

## 🏗️ Architecture

SQL Server Database  
↓  
Power BI Data Connection  
↓  
Data Modeling  
↓  
DAX Calculations  
↓  
Interactive Dashboard  

---

## 🗄️ Database Design

**Database Name:** `ECommerceBI`  
**Main Table:** `Orders`

### Table Schema

| Column      | Data Type        |
|------------|-----------------|
| OrderID     | INT (Identity, Primary Key) |
| OrderDate   | DATE |
| CustomerId  | INT |
| Product     | NVARCHAR(100) |
| Category    | NVARCHAR(50) |
| Quantity    | INT |
| UnitPrice   | DECIMAL(10,2) |
| City        | NVARCHAR(60) |

---

## 📈 Key Metrics

### 🔹 Total Revenue (SQL)

```sql
SELECT SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Orders;
