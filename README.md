# Infotact_DA_Internship_Project

## Project 1: Omnichannel Retail Sales Analytics

### Team Members
- Jebin Joy (Team Leader)
- Rivya Roy
- Saurav Gopinath 
- Delphin R
  
### Technologies Used
- Python
- Google Colab
- Pandas
- SQL
- Power BI
- GitHub

### Dataset
Online Retail Dataset
Dataset Link (Kaggle)- https://www.kaggle.com/datasets/thedevastator/online-retail-sales-and-customer-data

### Project Structure
- data → datasets
- notebooks → analysis notebooks
- sql → SQL queries
- dashboard → Power BI files
- reports → documentation


## Week 1 Progress – Data Cleaning & Preprocessing

### Tasks Completed
- Explored the online retail dataset using Pandas
- Checked dataset shape, columns, datatypes, and summary statistics
- Identified and handled missing values
- Removed duplicate records
- Converted InvoiceDate to datetime format
- Removed cancelled transactions
- Removed invalid quantity and price values
- Standardized text data formatting
- Detected and removed outliers using IQR method
- Created additional columns:
  - TotalPrice
  - Year
  - Month
  - Day
  - DayName
  - Hour
- Generated final cleaned dataset summary
- Maintained GitHub version control with regular commits

### Data Cleaning Techniques Used
- Missing Value Handling
- Duplicate Removal
- Datatype Conversion
- Outlier Detection (IQR Method)
- Feature Engineering
- Text Standardization


# Week 2 Progress – SQL & Relational Database Design

## Tasks Completed

- Imported the cleaned retail dataset into a SQLite database using Python and the `sqlite3` library.
- Configured the SQL working environment in Visual Studio Code using the SQLTools extension.
- Created the retail database and imported the cleaned CSV dataset into a single flat table using Python and Pandas.
- Performed exploratory SQL queries to understand dataset structure and transaction patterns.
- Utilized SQL aggregate functions including:
  - `COUNT()`
  - `SUM()`
  - `AVG()`
  - `MIN()`
  - `MAX()`
  - `DISTINCT()`
- Analyzed:
  - Total transaction records
  - Unique customers
  - Unique products
  - Revenue statistics
  - Country-wise transaction distribution
  - Date and time ranges

---

# Database Normalization

Converted the flat retail dataset into 3 normalized relational tables for improved database structure and query efficiency.

## 1. Products_Retaildb

Stores product-level information.

| Column Name |
|-------------|
| StockCode *(Primary Key)* |
| Description |

---

## 2. Invoices_Retaildb

Stores invoice and customer transaction metadata.

| Column Name |
|-------------|
| InvoiceNo *(Primary Key)* |
| InvoiceDate |
| CustomerID |
| Country |
| Year |
| Month |
| Day |
| DayName |
| Hour |

---

## 3. Sales_Retaildb

Stores transactional sales records.

| Column Name |
|-------------|
| SaleID *(Primary Key)* |
| InvoiceNo *(Foreign Key)* |
| StockCode *(Foreign Key)* |
| Quantity |
| UnitPrice |
| TotalPrice |

---

# SQL Querying & Analytics

- Developed SQL queries using:
  - `SELECT`
  - `WHERE`
  - `ORDER BY`
  - `GROUP BY`
  - `HAVING`
  - Aggregate Functions

- Performed business-oriented retail analytics including:
  - Revenue analysis
  - Product performance analysis
  - Country-wise sales analysis
  - Customer purchasing behavior
  - Peak operational hour analysis
  - Monthly and daily revenue trends

---

# JOIN Operations

- Implemented `INNER JOIN` operations across normalized tables:
  - `Sales_Retaildb`
  - `Invoices_Retaildb`
  - `Products_Retaildb`

- Combined transactional, product, and customer datasets to generate KPI-driven business insights and analytical reports.

---

# Technologies Used

- Python
- Pandas
- SQLite
- SQL
- Visual Studio Code (VS Code)
- SQLTools Extension
