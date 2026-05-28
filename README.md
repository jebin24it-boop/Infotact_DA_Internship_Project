# Infotact_DA_Internship_Project

## Project 1: Omnichannel Retail Sales Analytics

---

## Team Members

* Jebin Joy *(Team Leader)*
* Rivya Roy
* Saurav Gopinath
* Delphin R

---

# Project Overview

This project focuses on analyzing omnichannel retail sales data to generate meaningful business insights using Data Analytics techniques. The project involves data cleaning, preprocessing, SQL-based analytics, relational database design, and Power BI dashboard development for business decision-making.

---

# Objectives

* Clean and preprocess raw retail sales data
* Perform exploratory data analysis (EDA)
* Design a normalized relational database
* Execute SQL-based analytical queries
* Generate KPI-driven business insights
* Build interactive Power BI dashboards
* Apply an end-to-end Data Analytics workflow

---

# Technologies Used

* Python
* Pandas
* Google Colab
* SQLite
* SQL
* Power BI
* GitHub
* Visual Studio Code (VS Code)

---

# Dataset Information

### Dataset Name

Online Retail Sales and Customer Dataset

### Dataset Source

Kaggle Dataset:
https://www.kaggle.com/datasets/thedevastator/online-retail-sales-and-customer-data

### Dataset Description

The dataset contains:

* Customer purchase records
* Invoice details
* Product information
* Quantity and pricing data
* Country-wise transactions
* Date and time-based sales records

The dataset is used for retail sales analysis and business insight generation.

---

# Project Structure

```plaintext id="b6j6s7"
Infotact_DA_Internship_Project/
│
├── data/          → Raw and cleaned datasets
├── notebooks/     → Python notebooks for preprocessing & analysis
├── sql/           → SQL queries and database scripts
├── dashboard/     → Power BI dashboard files
├── reports/       → Internship documentation and reports
└── README.md
```

---

# Week 1 Progress – Data Cleaning & Preprocessing

## Tasks Completed

* Explored the online retail dataset using Pandas
* Checked dataset shape, columns, datatypes, and summary statistics
* Identified missing values and duplicate records
* Handled missing values in Description and CustomerID columns
* Removed duplicate rows from the dataset
* Converted InvoiceDate into datetime format
* Converted CustomerID into appropriate datatype
* Identified and removed cancelled transactions
* Removed invalid quantity and UnitPrice values
* Standardized text formatting in Description and Country columns
* Removed extra spaces and converted text values to uppercase
* Detected and removed outliers using the IQR method
* Created additional useful columns:

  * TotalPrice
  * Year
  * Month
  * Day
  * DayName
  * Hour
* Generated final cleaned dataset summary
* Maintained GitHub version control using commits and push operations

---

# Data Cleaning Techniques Used

* Missing Value Handling
* Duplicate Removal
* Datatype Conversion
* Outlier Detection (IQR Method)
* Feature Engineering
* Text Standardization

---

# Week 2 Progress – SQL & Relational Database Design

## Tasks Completed

* Imported cleaned retail dataset into SQLite database using Python and sqlite3
* Configured SQL environment using SQLTools extension in VS Code
* Created retail database and imported cleaned CSV dataset
* Performed exploratory SQL queries
* Used SQL aggregate functions including:

  * `COUNT()`
  * `SUM()`
  * `AVG()`
  * `MIN()`
  * `MAX()`
  * `DISTINCT()`

---

# Database Normalization

The flat retail dataset was normalized into 3 relational tables for improved database structure and query efficiency.

## 1. Products_Retaildb

| Column Name               |
| ------------------------- |
| StockCode *(Primary Key)* |
| Description               |

---

## 2. Invoices_Retaildb

| Column Name               |
| ------------------------- |
| InvoiceNo *(Primary Key)* |
| InvoiceDate               |
| CustomerID                |
| Country                   |
| Year                      |
| Month                     |
| Day                       |
| DayName                   |
| Hour                      |

---

## 3. Sales_Retaildb

| Column Name               |
| ------------------------- |
| SaleID *(Primary Key)*    |
| InvoiceNo *(Foreign Key)* |
| StockCode *(Foreign Key)* |
| Quantity                  |
| UnitPrice                 |
| TotalPrice                |

---

# SQL Querying & Analytics

Performed SQL analysis using:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `HAVING`
* Aggregate Functions

### Business Insights Generated

* Revenue analysis
* Product performance analysis
* Country-wise sales analysis
* Customer purchasing behavior
* Peak operational hour analysis
* Monthly revenue trends
* Daily sales trends

---

# JOIN Operations

Implemented `INNER JOIN` operations across:

* `Sales_Retaildb`
* `Invoices_Retaildb`
* `Products_Retaildb`

Combined transactional, customer, and product datasets to generate analytical business reports and KPI insights.

---

# Power BI Dashboard(Planned)

## Dashboard Features

* KPI Cards
* Revenue Trend Analysis
* Country-wise Sales Visualization
* Product Performance Analysis
* Customer Insights
* Time-based Analysis
* Interactive Filters & Slicers

---

# Key Skills Applied

* Data Cleaning
* Data Preprocessing
* Exploratory Data Analysis (EDA)
* SQL Querying
* Database Normalization
* Data Visualization
* Business Analytics
* Dashboard Development
* GitHub Version Control

---

# Current Project Status

The project is currently in progress. Initial stages including data cleaning, preprocessing, SQL analytics, and relational database design have been completed successfully.

The next phase involves:

* Advanced Power BI dashboard development
* KPI visualization
* Business insight generation
* Dashboard optimization and interactivity

---

# Upcoming Work

* Complete Power BI dashboard development
* Add advanced KPI visualizations
* Perform deeper business insight analysis
* Improve dashboard interactivity
* Finalize internship documentation

---
