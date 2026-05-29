-- JOINS USING CLAUSES
-- The retail database maintains strong referential integrity between
-- Sales, Invoices, and Products tables. Therefore, INNER JOIN is
-- primarily used to combine matching transactional records for
-- retail sales analytics and reporting.
--45.Combine sales transactions with customer invoice details
SELECT
    S.InvoiceNo,
    I.CustomerID,
    I.Country,
    I.InvoiceDate,
    S.Quantity,
    S.UnitPrice,
    S.TotalPrice
FROM Sales_Retaildb S
INNER JOIN Invoices_Retaildb I
ON S.InvoiceNo = I.InvoiceNo
LIMIT 50;

--46. Combine sales records with product descriptions
SELECT
    S.InvoiceNo,
    P.StockCode,
    P.Description,
    S.Quantity,
    S.TotalPrice
FROM Sales_Retaildb S
INNER JOIN Products_Retaildb P
ON S.StockCode = P.StockCode
LIMIT 50;

-- 47.Complete retail transaction view using all 3 tables
SELECT
    I.InvoiceDate,
    I.CustomerID,
    I.Country,
    P.Description,
    S.Quantity,
    S.UnitPrice,
    S.TotalPrice
FROM Sales_Retaildb S
INNER JOIN Invoices_Retaildb I
ON S.InvoiceNo = I.InvoiceNo
INNER JOIN Products_Retaildb P
ON S.StockCode = P.StockCode
LIMIT 100;

-- 48.Filter sales transactions for Belgium where the total price equals 10
SELECT 
      S.SaleID,S.InvoiceNo,I.CustomerID,S.Quantity,S.UnitPrice,S.TotalPrice,
      I.Country,I.Hour
      FROM Sales_Retaildb S
      INNER JOIN Invoices_Retaildb I ON S.InvoiceNo=I.InvoiceNo WHERE I.Country='BELGIUM' AND TotalPrice=10;

-- 49.Filter sales transactions for orders originating from Eire
SELECT 
      S.SaleID,S.InvoiceNo,I.CustomerID,S.Quantity,S.UnitPrice,S.TotalPrice,
      I.Country,I.Hour
      FROM Sales_Retaildb S
      INNER JOIN Invoices_Retaildb I ON S.InvoiceNo=I.InvoiceNo WHERE I.Country='EIRE';

-- 50.Filter sales transactions for orders originating from United Kingdom
SELECT 
      S.SaleID,S.InvoiceNo,I.CustomerID,S.Quantity,S.UnitPrice,S.TotalPrice,
      I.Country,I.Hour
      FROM Sales_Retaildb S
      INNER JOIN Invoices_Retaildb I ON S.InvoiceNo=I.InvoiceNo WHERE I.Country='UNITED KINGDOM';

-- 51.Filter product descriptions for items with quantities between 6 and 10 ordered by total price ascending
SELECT 
      S.StockCode,S.Quantity,S.UnitPrice,
      P.StockCode,P.Description
      FROM Sales_Retaildb S
      INNER JOIN Products_Retaildb P ON S.StockCode=P.StockCode WHERE Quantity >= 6 AND Quantity <= 10
      ORDER BY TotalPrice ASC;

-- 52.Filter product descriptions for items with quantities between 10 and 25 ordered by total price ascending
SELECT 
      S.StockCode,S.Quantity,S.UnitPrice,
      P.StockCode,P.Description
      FROM Sales_Retaildb S
      INNER JOIN Products_Retaildb P ON S.StockCode=P.StockCode WHERE Quantity >= 10 AND Quantity <= 25
      ORDER BY TotalPrice ASC;

-- 53.Filter items with a unit price between 1 and 5 ordered by unit price ascending
SELECT S.StockCode,S.Quantity,S.UnitPrice,
       P.Description FROM Sales_Retaildb S INNER JOIN 
       Products_Retaildb P ON S.StockCode=P.StockCode WHERE S.UnitPrice>=1 AND S.UnitPrice<=5
       ORDER BY UnitPrice ASC;

-- 54.Filter items with a unit price between 5 and 10 ordered by unit price ascending
SELECT S.StockCode,S.Quantity,S.UnitPrice,
       P.Description FROM Sales_Retaildb S INNER JOIN 
       Products_Retaildb P ON S.StockCode=P.StockCode WHERE S.UnitPrice>=5 AND S.UnitPrice<=10
       ORDER BY UnitPrice ASC;

-- 55.Extract item transaction rows that occurred specifically on weekdays ordered by day name descending
SELECT I.InvoiceDate,I.InvoiceNo,I.Country,I.DayName,I.Hour,
       S.Quantity,S.UnitPrice FROM Invoices_Retaildb I INNER JOIN
       Sales_Retaildb S ON I.InvoiceNo=S.InvoiceNo WHERE I.DayName IN('Monday','Tuesday','Wednesday','Thursday','Friday')
       ORDER BY DayName DESC;

-- 56.Extract item transaction rows that occurred specifically on weekends ordered by day name descending
SELECT I.InvoiceDate,I.InvoiceNo,I.Country,I.DayName,I.Hour,
       S.Quantity,S.UnitPrice FROM Invoices_Retaildb I INNER JOIN
       Sales_Retaildb S ON I.InvoiceNo=S.InvoiceNo WHERE I.DayName IN('Saturday','Sunday')
       ORDER BY DayName DESC;

-- 57.Calculate total revenue contribution grouped by country
SELECT I.Country,ROUND(SUM(S.TotalPrice),2) AS Revenue FROM Sales_Retaildb S
    INNER JOIN Invoices_Retaildb i ON S.InvoiceNo=I.InvoiceNo
    GROUP BY I.Country;

-- 58.Calculate the average unit price of items grouped by purchase quantity
SELECT P.Description,S.Quantity,ROUND(AVG(S.UnitPrice),2) AS Average_Revenue_Product
       FROM Products_Retaildb P INNER JOIN Sales_Retaildb S ON P.StockCode=S.StockCode
       GROUP BY S.Quantity;

-- 59.Sum the total quantity of items sold grouped by country
SELECT I.Country,S.SaleID,ROUND(SUM(S.Quantity),2) AS Sum_Of_Quantity
       FROM Invoices_Retaildb I INNER JOIN Sales_Retaildb S ON I.InvoiceNo=S.InvoiceNo
       GROUP BY I.Country ;

-- 60.Count the total line item entries grouped by country ordered by invoice hour ascending
SELECT S.SaleID,COUNT(S.Quantity) AS Count_Of_Quantity,I.Hour,I.Country
       FROM Sales_Retaildb S INNER JOIN Invoices_Retaildb I ON S.InvoiceNo=I.InvoiceNo
       GROUP BY I.Country ORDER BY I.Hour ASC;

-- 61.Rank the top 30 product descriptions based on total revenue generated descending
SELECT P.Description,ROUND(SUM(S.TotalPrice),2) AS Total_Revenue FROM Products_Retaildb P
       INNER JOIN Sales_Retaildb S ON P.StockCode=S.StockCode 
       GROUP BY P.Description ORDER BY Total_Revenue DESC LIMIT 30;
       
-- 62.Rank the top 30 customers based on total spending value descending
SELECT I.CustomerID,ROUND(SUM(S.TotalPrice),2) AS Total_Spent FROM Invoices_Retaildb I
       INNER JOIN Sales_Retaildb S ON I.InvoiceNo=S.InvoiceNo
       GROUP BY I.CustomerID ORDER BY Total_Spent DESC LIMIT 30;

-- 63.Find the minimum and maximum quantity sold per item line grouped by country ordered by sale ID ascending
SELECT I.Country,MIN(S.Quantity) AS MIN_Quantity,MAX(S.Quantity) AS MAX_Quantity FROM Sales_Retaildb S 
       INNER JOIN Invoices_Retaildb I ON S.InvoiceNo = I.InvoiceNo
       GROUP BY I.Country 
       ORDER BY I.Country ASC;

-- 64.Calculate total revenue tracking metrics grouped and ordered by hour descending
SELECT I.Hour,ROUND(SUM(TotalPrice),2) AS Hourly_Revenue
       FROM Sales_Retaildb S INNER JOIN Invoices_Retaildb I
       ON S.InvoiceNo=I.InvoiceNo GROUP BY I.Hour ORDER BY Hourly_Revenue DESC;

--65. Rank the top 20 most popular product descriptions by unique order counts descending
SELECT P.Description,COUNT(DISTINCT S.InvoiceNo) AS Total_Orders
       FROM Sales_Retaildb S INNER JOIN Products_Retaildb P ON S.StockCode=P.StockCode
       GROUP BY P.Description ORDER BY Total_Orders DESC LIMIT 20;

--66. Calculate total physical units sold grouped by country and product description ordered by quantity descending
SELECT I.Country,P.Description,SUM(S.Quantity) AS Total_Units_Sold
       FROM Sales_Retaildb S INNER JOIN Invoices_Retaildb I ON S.InvoiceNo=I.InvoiceNo
       INNER JOIN Products_Retaildb P ON S.StockCode=P.StockCode 
       GROUP BY I.Country,P.Description ORDER BY Total_Units_Sold DESC;

--67. Calculate total revenue trends grouped and ordered by day of the week descending
SELECT I.DayName,ROUND(SUM(S.TotalPrice),2) AS Daily_Revenue FROM 
       Sales_Retaildb S INNER JOIN Invoices_Retaildb I ON S.InvoiceNo=I.InvoiceNo
       GROUP BY I.DayName ORDER BY Daily_Revenue DESC;

--68. Track revenue fluctuations over a timeline grouped and ordered by year and month
SELECT I.Year,I.Month,ROUND(SUM(S.TotalPrice),2) AS Monthly_Revenue
       FROM Sales_Retaildb S INNER JOIN Invoices_Retaildb I ON S.InvoiceNo = I.InvoiceNo
       GROUP BY I.Year, I.Month
       ORDER BY I.Year, I.Month;

--69. Filter product descriptions with total gross revenue exceeding 15000 ordered by revenue descending
SELECT P.Description,ROUND(SUM(S.TotalPrice),2) AS Revenue FROM Sales_Retaildb S
       INNER JOIN Products_Retaildb P ON S.StockCode = P.StockCode
       GROUP BY P.Description HAVING Revenue > 15000 ORDER BY Revenue DESC;

-- 70.Filter product descriptions maintaining an average unit price between 1 and 10 ordered by average price
SELECT P.Description,ROUND(AVG(S.UnitPrice),2) AS AVG_Revenue FROM Sales_Retaildb S
       INNER JOIN Products_Retaildb P ON S.StockCode=P.StockCode
       GROUP BY P.Description HAVING AVG_REVENUE>1 AND AVG_Revenue < 10 ORDER BY AVG_Revenue;

-- 71.Extract item range boundaries grouped across unique country targets
SELECT I.InvoiceDate,I.Country,MIN(S.Quantity) AS MIN_Quantity,MAX(S.Quantity) AS MAX_Quantity,
       P.Description FROM Invoices_Retaildb I INNER JOIN Sales_Retaildb S ON I.InvoiceNo=S.InvoiceNo
       INNER JOIN  Products_Retaildb P ON S.StockCode=P.StockCode
       GROUP BY I.Country;
--WEEK 2 - 3
-- 72. Identify the top 10 best-selling product descriptions specifically for customers in Germany
SELECT P.Description, SUM(S.Quantity) AS Total_German_Sales
FROM Sales_Retaildb S
INNER JOIN Invoices_Retaildb I ON S.InvoiceNo = I.InvoiceNo
INNER JOIN Products_Retaildb P ON S.StockCode = P.StockCode
WHERE I.Country = 'GERMANY'
GROUP BY P.Description
ORDER BY Total_German_Sales DESC LIMIT 10;

-- 73. Count the total number of unique product types purchased by each individual customer
SELECT I.CustomerID, COUNT(DISTINCT S.StockCode) AS Unique_Products_Bought
FROM Sales_Retaildb S
INNER JOIN Invoices_Retaildb I ON S.InvoiceNo = I.InvoiceNo
WHERE I.CustomerID IS NOT NULL
GROUP BY I.CustomerID
ORDER BY Unique_Products_Bought DESC LIMIT 20;

-- 74. Track the monthly revenue generated specifically by items containing the keyword 'BAG'
SELECT I.Year, I.Month, ROUND(SUM(S.TotalPrice), 2) AS Bag_Revenue
FROM Sales_Retaildb S
INNER JOIN Invoices_Retaildb I ON S.InvoiceNo = I.InvoiceNo
INNER JOIN Products_Retaildb P ON S.StockCode = P.StockCode
WHERE P.Description LIKE '%BAG%'
GROUP BY I.Year, I.Month
ORDER BY I.Year, I.Month;
       

--Advanced Queries

-- 80. Use a Window Function (ROW_NUMBER) to number each customer's orders chronologically 
SELECT I.CustomerID, I.InvoiceDate, S.InvoiceNo, S.TotalPrice,
       ROW_NUMBER() OVER (PARTITION BY I.CustomerID ORDER BY I.InvoiceDate ASC) AS Customer_Order_Sequence
FROM Sales_Retaildb S
INNER JOIN Invoices_Retaildb I ON S.InvoiceNo = I.InvoiceNo
WHERE I.CustomerID IS NOT NULL
LIMIT 30;

-- 81. Use DENSE_RANK() to find and rank the top 10 best-selling products by total quantity sold
SELECT S.StockCode, P.Description, SUM(S.Quantity) AS Total_Units_Moved,
       DENSE_RANK() OVER (ORDER BY SUM(S.Quantity) DESC) AS Sales_Velocity_Rank
FROM Sales_Retaildb S
INNER JOIN Products_Retaildb P ON S.StockCode = P.StockCode
GROUP BY S.StockCode, P.Description
LIMIT 10;

-- 82. Use a subquery to find products with an average quantity sold above the overall average quantity across all products
SELECT StockCode,
       ROUND(AVG(Quantity),2) AS Avg_Quantity_Sold
FROM Sales_Retaildb
GROUP BY StockCode
HAVING Avg_Quantity_Sold >
(
    SELECT AVG(Quantity)
    FROM Sales_Retaildb
);

-- 83. Use a CASE statement to segment orders into seasonal shopping blocks based on the invoice month
SELECT I.InvoiceNo, I.Month,
       CASE WHEN I.Month IN (11, 12, 1) THEN 'Holiday Peak'
            WHEN I.Month IN (6, 7, 8) THEN 'Summer Surge'
            ELSE 'Standard Off-Peak' END AS Seasonal_Segment
FROM Invoices_Retaildb I
LIMIT 30;

-- 84. Calculate the percentage contribution of each country's revenue to the total revenue using a subquery
SELECT Country,
       Revenue,
       ROUND(
           Revenue * 100.0 /
           SUM(Revenue) OVER (),
           2
       ) AS Revenue_Percentage
FROM (
    SELECT I.Country,
           SUM(S.TotalPrice) AS Revenue
    FROM Sales_Retaildb S
    INNER JOIN Invoices_Retaildb I
    ON S.InvoiceNo = I.InvoiceNo
    GROUP BY I.Country
);