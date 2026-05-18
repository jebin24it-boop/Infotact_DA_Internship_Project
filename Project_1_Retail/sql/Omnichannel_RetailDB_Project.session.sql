/*DAY 6 --> Queries Using Select*/
--Initial Queries For EDA for Data Analysis (FLAT TABLE) --> 1 table

--1.Query to display the FIRST 10- ROWS
SELECT * FROM Retail_Dataset LIMIT 10;

--2.See all column names and data types
PRAGMA table_info (Retail_Dataset);

--3.Total Rows  in the dataset
SELECT COUNT(*) AS total_rows FROM Retail_Dataset;

-- 4. Check range of our date
SELECT MIN(InvoiceDate) AS earlieast_date,MAX(InvoiceDate) AS latest_date FROM Retail_Dataset; 

--5. How many unique customers
SELECT COUNT(DISTINCT CustomerID) AS total_customers FROM Retail_Dataset;

-- 6. How many unique products?
SELECT COUNT(DISTINCT Description) AS total_products 
FROM Retail_Dataset;

-- 7. How many unique countries?
SELECT COUNT(DISTINCT Country) AS total_countries 
FROM Retail_Dataset;

-- 8. How many unique orders (invoices)?
SELECT COUNT(DISTINCT InvoiceNo) AS total_orders 
FROM Retail_Dataset;

--10. Unique Invoice Number
/*--9. Display all the rows*/
/*SELECT * FROM Retail_Dataset;*/


SELECT DISTINCT InvoiceNo FROM Retail_Dataset;

--11. Unique Stock-Code
SELECT DISTINCT StockCode FROM Retail_Dataset;

--12. Unique Description
SELECT DISTINCT Description FROM Retail_Dataset;

--13. Unique Quantity
SELECT DISTINCT Quantity FROM Retail_Dataset;

--14.Unique Invoice Date
SELECT DISTINCT InvoiceDate FROM Retail_Dataset;

--15.Unique Unit price
SELECT DISTINCT UnitPrice FROM Retail_Dataset;

--16.Unique Customer ID
SELECT DISTINCT CustomerID FROM Retail_Dataset;

--17.Unique Country
SELECT DISTINCT Country FROM Retail_Dataset;

--18.Unique TotalPrice
SELECT DISTINCT TotalPrice FROM Retail_Dataset;

--19.Unique Year
SELECT DISTINCT Year FROM Retail_Dataset;

--20.Unique Month
SELECT DISTINCT Month FROM Retail_Dataset;

--21.Unique Day
SELECT DISTINCT Day FROM Retail_Dataset;

--22.Unique Day Name
SELECT DISTINCT DayName FROM Retail_Dataset;

--23.unique hours
SELECT DISTINCT Hour FROM Retail_Dataset;

--24.Reveneue Summary
SELECT ROUND(SUM(TotalPrice),2) AS total_revenue,
       ROUND(AVG(TotalPrice),2) AS avg_order_value,
       ROUND(MIN(TotalPrice),2) AS min_price,
       ROUND(MAX(TotalPrice),2) AS max_price
FROM Retail_Dataset;

-- 25. NUll Check
SELECT SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS null_customers,
       SUM(CASE WHEN TotalPrice IS NULL THEN 1 ELSE 0 END) AS null_price,
       SUM(CASE WHEN InvoiceDate IS NULL THEN 1 ELSE 0 END) AS null_dates,
       SUM(CASE WHEN Description is NULL THEN 1 ELSE 0 END) AS null_products
FROM Retail_Dataset;

