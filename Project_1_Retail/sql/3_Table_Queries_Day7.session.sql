--Day 7
--Splitted the database into 3 tables -- Sales_Retaildb,Invoices_Retaildb,Products_Retaildb
--1. Display 15 rows of the sales table
SELECT * FROM Sales_Retaildb LIMIT 300;

--2.Display 15 rows of the Invoices table
SELECT * FROM Invoices_Retaildb LIMIT 300;

--3.Display 15 rows of the products table
SELECT * FROM Products_Retaildb LIMIT 300;

--Count of Total rows in invoices table
SELECT COUNT(*) FROM Invoices_Retaildb;

--count of total rows in products table
SELECT COUNT(*) FROM Products_Retaildb;

--count of total rows in sales table
SELECT COUNT(*) FROM Sales_Retaildb;


--4.Data types of Sales_Retaildb table
PRAGMA table_info(Sales_Retaildb);

--5.Data types of Invoices_Retaildb table
PRAGMA table_info(Invoices_Retaildb);

--6.Data types of Products_Retaildb table
PRAGMA table_info(Products_Retaildb);

-- Queries using where condition
--7. Selecting the product with that stock code
SELECT * FROM Products_Retaildb WHERE StockCode='85123A';

--8. Searching for the product containing a specfic keyword
SELECT * FROM Products_Retaildb WHERE Description LIKE '%POLKADOT%';

--9.Filter orders for a specfic country
SELECT * FROM Invoices_Retaildb WHERE Country='FRANCE';

--10.Find transactions during peak hours
SELECT * FROM Invoices_Retaildb WHERE Hour=15;

--11.Filter order history of an individual customer using their id
SELECT * FROM Invoices_Retaildb WHERE CustomerID='12680';

--12.Filters customers who bought more than 50 units of a product
SELECT * FROM Sales_Retaildb WHERE Quantity > 20;

--13.Invoice that bought total price greater than 100
SELECT * FROM Sales_Retaildb WHERE TotalPrice > 100;

--14.finding if a specfic Product was sold with a cheap price
SELECT * FROM Sales_Retaildb WHERE UnitPrice < 2;

--15.Calculate total revenue and average unit price
SELECT ROUND(SUM(TotalPrice),2) AS Total_Retail_Revenue,ROUND(AVG(UnitPrice),2) AS Avg_Unit_Price,SUM(Quantity) AS Total_Items_Sold FROM Sales_Retail_db;