IF DB_ID('ECommerceBI') IS NULL
BEGIN
    EXEC('CREATE DATABASE ECommerceBI');
END
GO

USE ECommerceBI;
GO

/* 2) Orders tablosu */
IF OBJECT_ID('dbo.Orders','U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO

CREATE TABLE dbo.Orders
(
    OrderID     INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate   DATE        NOT NULL,
    CustomerId  INT         NOT NULL,
    Product     NVARCHAR(100) NOT NULL,
    Category    NVARCHAR(50)  NOT NULL,
    Quantity    INT         NOT NULL CHECK (Quantity > 0),
    UnitPrice   DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    City        NVARCHAR(60)  NOT NULL
);
GO

/* 3) Örnek veri (2025-01 .. 2025-12 arasý, farklý þehir/ürün) */
INSERT INTO dbo.Orders (OrderDate, CustomerId, Product, Category, Quantity, UnitPrice, City)
VALUES
('2025-01-05', 101, N'Bluetooth Kulaklýk', N'Elektronik', 2, 799.90, N'Trabzon'),
('2025-01-08', 102, N'Akýllý Saat',       N'Elektronik', 1, 2499.00, N'Ýstanbul'),
('2025-01-15', 103, N'Koþu Ayakkabýsý',   N'Spor',       1, 1899.00, N'Ankara'),
('2025-02-02', 101, N'Powerbank',         N'Elektronik', 3, 499.90,  N'Trabzon'),
('2025-02-11', 104, N'Sweatshirt',        N'Giyim',      2, 649.90,  N'Bursa'),
('2025-02-18', 105, N'Tiþört',            N'Giyim',      4, 299.90,  N'Ýzmir'),
('2025-03-03', 106, N'Yoga Matý',         N'Spor',       2, 399.90,  N'Antalya'),
('2025-03-14', 107, N'Laptop Çantasý',    N'Aksesuar',   1, 899.90,  N'Ýstanbul'),
('2025-04-09', 108, N'Bluetooth Kulaklýk',N'Elektronik', 1, 799.90,  N'Samsun'),
('2025-04-22', 109, N'Akýllý Saat',       N'Elektronik', 1, 2499.00, N'Trabzon'),
('2025-05-01', 110, N'Eþofman Altý',      N'Giyim',      1, 799.90,  N'Ankara'),
('2025-05-19', 111, N'Koþu Ayakkabýsý',   N'Spor',       2, 1899.00, N'Ýstanbul'),
('2025-06-06', 112, N'Güneþ Gözlüðü',     N'Aksesuar',   1, 1199.00, N'Ýzmir'),
('2025-06-21', 113, N'Powerbank',         N'Elektronik', 2, 499.90,  N'Bursa'),
('2025-07-04', 114, N'Tiþört',            N'Giyim',      3, 299.90,  N'Trabzon'),
('2025-07-18', 115, N'Yoga Matý',         N'Spor',       1, 399.90,  N'Antalya'),
('2025-08-10', 116, N'Laptop Çantasý',    N'Aksesuar',   2, 899.90,  N'Ýstanbul'),
('2025-08-25', 117, N'Güneþ Gözlüðü',     N'Aksesuar',   2, 1199.00, N'Samsun'),
('2025-09-07', 118, N'Akýllý Saat',       N'Elektronik', 2, 2499.00, N'Ankara'),
('2025-09-29', 119, N'Sweatshirt',        N'Giyim',      1, 649.90,  N'Ýzmir'),
('2025-10-12', 120, N'Bluetooth Kulaklýk',N'Elektronik', 3, 799.90,  N'Ýstanbul'),
('2025-10-28', 121, N'Eþofman Altý',      N'Giyim',      2, 799.90,  N'Trabzon'),
('2025-11-09', 122, N'Koþu Ayakkabýsý',   N'Spor',       1, 1899.00, N'Bursa'),
('2025-11-23', 123, N'Powerbank',         N'Elektronik', 5, 499.90,  N'Ýstanbul'),
('2025-12-02', 124, N'Tiþört',            N'Giyim',      6, 299.90,  N'Ankara'),
('2025-12-18', 125, N'Güneþ Gözlüðü',     N'Aksesuar',   1, 1199.00, N'Trabzon');
GO

/* Kontrol */
SELECT TOP 10 * FROM dbo.Orders ORDER BY OrderDate;


SELECT SUM(Quantity * UnitPrice) AS TotalRevenue
FROM dbo.Orders;


SELECT
    DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS MonthStart,
    SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM dbo.Orders
GROUP BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
ORDER BY MonthStart;


SELECT TOP 10
    Product,
    SUM(Quantity) AS TotalQuantity
FROM dbo.Orders
GROUP BY Product
ORDER BY TotalQuantity DESC;


SELECT TOP 10
    Product,
    SUM(Quantity * UnitPrice) AS Revenue
FROM dbo.Orders
GROUP BY Product
ORDER BY Revenue DESC;


SELECT
    City,
    SUM(Quantity * UnitPrice) AS Revenue
FROM dbo.Orders
GROUP BY City
ORDER BY Revenue DESC;

USE ECommerceBI;
GO

SELECT COUNT(*) AS TotalRows
FROM dbo.Orders;
GO