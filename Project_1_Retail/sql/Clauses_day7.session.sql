--DAY 7 -- QUERIES USING HAVING, GROUP BY ,ORDER BY, LIMIT

-- 16.Most Expensive Products
SELECT * FROM Sales_Retaildb ORDER BY UnitPrice DESC LIMIT 10;

--17.Find 15 most orders to check the latest transactional timeline
SELECT * FROM Invoices_Retaildb ORDER BY Year DESC,Month DESC,Day DESC,Hour DESC LIMIT 15;

--18.Product  displayed alphabetically
SELECT * FROM Products_Retaildb ORDER BY Description ASC;

--19.Top 20 single line transactions with the highest quantity
SELECT * FROM Sales_Retaildb ORDER BY Quantity DESC LIMIT 20;

--20.orders sorted by month
SELECT * FROM Invoices_Retaildb ORDER BY Month ASC;

--21. Total Quantity sold and revenue generated per unique product code
SELECT StockCode,SUM(Quantity) AS Total_Units_Sold,Round(SUM(TotalPrice),2) AS Gross_Product_Sales FROM Sales_Retaildb GROUP BY StockCode;

--22. Average item value and Maximum Single purchase value per product code
SELECT StockCode,ROUND(AVG(TotalPrice),2) AS Avg_Line_Value,ROUND(MAX(TotalPrice),2) AS Max_Single_Line_Value FROM Sales_Retaildb GROUP BY StockCode;

--23. Hourly order distribution:Count unique hours to identify peak operational times
SELECT Hour,COUNT(InvoiceNo) AS Unique_Order_Count FROM Invoices_Retaildb GROUP BY Hour;

--24. Weekly order distribution : Find out which days of the week Process the most orders
SELECT DayName,COUNT(InvoiceNo) AS Total_Orders_Processed FROM Invoices_Retaildb GROUP BY Hour;

--25. Seasonal Demand : Group by year and Month to track how to order volume changes monthly
SELECT Year,Month,Count(InvoiceNo) AS Monthly_Order_Volume FROM Invoices_Retaildb GROUP BY Year,Month;

--26.Market Penetration : Count Unique Orders and unique buyers across different countries
SELECT Country,COUNT(InvoiceNo) AS Market_Order_Volume,COUNT(DISTINCT CustomerID) AS Active_Customers_In_Country FROM Invoices_Retaildb GROUP BY Country;

--27.Customer Purchase Frequency : Track how many Seprate checkout sessions each CustomerID completed
SELECT CustomerID,COUNT(InvoiceNo) AS Total_Purchase_Sessions FROM Invoices_Retaildb WHERE CustomerID IS NOT NULL GROUP BY CustomerID;

--28.High revenue Product codes : Finding Product codes that have bought in more than $15,000 in gross sales
SELECT StockCode,ROUND(SUM(TotalPrice),2) AS Gross_Product_Sales FROM Sales_Retaildb GROUP BY StockCode HAVING Gross_Product_Sales > 15000;

--29. Heavy Volume Items : Find Product codes where greater than 10,000 units have been sold
SELECT StockCode,SUM(Quantity) AS Total_Units_Sold FROM Sales_Retaildb GROUP BY StockCode HAVING Total_Units_Sold > 10000;

-- 30. High Margin Items: Products with avg price above $5
SELECT StockCode,ROUND(AVG(UnitPrice), 2) AS High_Avg_Price,COUNT(InvoiceNo) AS Times_Sold FROM Sales_Retaildb GROUP BY StockCode HAVING High_Avg_Price > 5.00 ORDER BY High_Avg_Price DESC LIMIT 20;

--31. Massive wholesale orders : Isolate invoices that contain less than or equal to 40 unique products
SELECT InvoiceNo,COUNT(StockCode) AS Unique_Items_In_Order FROM Sales_Retaildb GROUP BY InvoiceNo HAVING Unique_Items_In_Order < 40 ORDER BY InvoiceNo ASC;

--33. High values Invoices : Find specfic order numbers Where the total single bill is greater than 2000
SELECT InvoiceNo,ROUND(SUM(TotalPrice),2) AS Bulk_Invoice_Total FROM Sales_Retaildb GROUP BY InvoiceNo HAVING Bulk_Invoice_Total > 2000.00 ORDER BY InvoiceNo DESC;

--34.Elite Repeat Shoppers: Identify individual customer IDs who have completed more than 50 separate checkout sessions
SELECT CustomerID,COUNT(InvoiceNo) AS Total_Purchase_Sessions FROM Invoices_Retaildb WHERE CustomerID IS NOT NULL GROUP BY CustomerID HAVING Total_Purchase_Sessions > 50 ORDER BY CustomerID ASC;

--35. Granular Peak Operations: Find the absolute busiest Day and Hour combinations
SELECT DayName, Hour, COUNT(InvoiceNo) AS Total_Checkout_Sessions FROM Invoices_Retaildb GROUP BY DayName, Hour ORDER BY Total_Checkout_Sessions DESC LIMIT 15;

--36. High-Distribution Catalog Products: Product codes that appear across more than 800 distinct invoices
SELECT StockCode, COUNT(DISTINCT InvoiceNo) AS Total_Distinct_Invoices FROM Sales_Retaildb GROUP BY StockCode HAVING Total_Distinct_Invoices > 800 ORDER BY Total_Distinct_Invoices DESC;

--37. High-Volume Warehouse Movements: Invoices shifting more than 2,000 total inventory items
SELECT InvoiceNo, SUM(Quantity) AS Total_Units_Moved FROM Sales_Retaildb GROUP BY InvoiceNo HAVING Total_Units_Moved > 2000 ORDER BY Total_Units_Moved DESC;

--38. Product Pricing Consistency Audit: Monitor item unit price fluctuations across orders
SELECT StockCode, ROUND(MAX(UnitPrice), 2) AS Max_Price, ROUND(MIN(UnitPrice), 2) AS Min_Price, ROUND(MAX(UnitPrice) - MIN(UnitPrice), 2) AS Price_Fluctuation FROM Sales_Retaildb GROUP BY StockCode HAVING Price_Fluctuation > 0.00 ORDER BY Price_Fluctuation DESC LIMIT 15;

--39. High-Density International Customer Hubs: Countries containing more than 50 unique active buyer IDs
SELECT Country, COUNT(DISTINCT CustomerID) AS Total_Unique_Customers FROM Invoices_Retaildb WHERE CustomerID IS NOT NULL GROUP BY Country HAVING Total_Unique_Customers > 50 ORDER BY Total_Unique_Customers DESC;

-- 40. High-Ticket Orders: Invoices where avg item price exceeds $4
SELECT InvoiceNo,ROUND(AVG(UnitPrice), 2) AS Avg_Item_Value,COUNT(StockCode) AS Items_In_Order FROM Sales_Retaildb GROUP BY InvoiceNo HAVING Avg_Item_Value > 4.00 ORDER BY Avg_Item_Value DESC LIMIT 20;

--41. Low-Velocity Underperforming Inventory Lines: Products sold fewer than 5 times in total
SELECT StockCode, SUM(Quantity) AS Total_Units_Sold FROM Sales_Retaildb GROUP BY StockCode HAVING Total_Units_Sold < 5 ORDER BY Total_Units_Sold ASC;

--42. High-Value Basket Invoices: Orders where the average line-item revenue contribution exceeds $150
SELECT InvoiceNo, ROUND(AVG(TotalPrice), 2) AS Avg_Line_Revenue FROM Sales_Retaildb GROUP BY InvoiceNo HAVING Avg_Line_Revenue > 150.00 ORDER BY Avg_Line_Revenue DESC;

--43. Concentrated Consumer Markets: Countries where active buyers make an average of more than 15 separate orders
SELECT Country, COUNT(InvoiceNo) / COUNT(DISTINCT CustomerID) AS Orders_Per_Customer FROM Invoices_Retaildb WHERE CustomerID IS NOT NULL GROUP BY Country HAVING Orders_Per_Customer > 15 ORDER BY Orders_Per_Customer DESC;

-- 44.Check what AVG prices actually look like per product
SELECT StockCode,ROUND(AVG(UnitPrice), 2) AS Avg_Price FROM Sales_Retaildb GROUP BY StockCode ORDER BY Avg_Price DESC LIMIT 20;