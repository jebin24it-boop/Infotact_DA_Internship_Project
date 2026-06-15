# Infotact Data Analytics Internship Project

## Project Title

# Omnichannel Retail Sales Analytics

---

## Team Members

| Member                      | Role                                                                                                                                                |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Jebin Joy (Team Leader)** | Exploratory Data Analysis (EDA), Data Visualization, Power BI Dashboard Development, Business Insights Generation, Documentation, GitHub Management |
| **Rivya Roy**               | Data Cleaning & Preprocessing                                                                                                                       |
| **Saurav Gopinath**         | SQL Analytics & Relational Database Design                                                                                                          |

---

# Project Overview

The Omnichannel Retail Sales Analytics Project focuses on transforming raw retail transaction data into meaningful business insights through Data Analytics techniques.

The project follows an end-to-end analytics workflow involving data cleaning, preprocessing, exploratory data analysis, relational database design, SQL-based analytics, dashboard development, and business insight generation.

The primary objective is to help businesses understand sales performance, customer behavior, product trends, and revenue patterns to support data-driven decision-making.

---

# Project Objectives

* Clean and preprocess raw retail sales data
* Perform Exploratory Data Analysis (EDA)
* Design a normalized relational database
* Execute SQL-based analytical queries
* Generate KPI-driven business insights
* Build interactive Power BI dashboards
* Apply an end-to-end Data Analytics workflow
* Support business decision-making through data visualization

---

# Technologies Used

### Programming & Analysis

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn

### Database & Querying

* SQLite
* SQL

### Visualization & Reporting

* Power BI

### Development Tools

* Google Colab
* Visual Studio Code (VS Code)
* Git
* GitHub

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
* Invoice information
* Product details
* Quantity and pricing information
* Country-wise transaction records
* Date and time-based sales information

The dataset enables comprehensive retail sales analysis and business intelligence reporting.

---

# Project Workflow

```text
Raw Dataset
      ↓
Data Cleaning & Preprocessing
      ↓
Exploratory Data Analysis (EDA)
      ↓
Database Design & Normalization
      ↓
SQL Analytics
      ↓
Power BI Dashboard Development
      ↓
Business Insights Generation
      ↓
Documentation & Reporting
```

---

# Project Structure

```plaintext
Infotact_DA_Internship_Project/
│
├── data/
│   ├── raw_data
│   └── cleaned_data
│
├── notebooks/
│   ├── data_cleaning
│   ├── exploratory_analysis
│   └── visualization
│
├── sql/
│   ├── database_scripts
│   └── sql_queries
│
├── dashboard/
│   ├── Retail_Analytics_Dashboard.pbix
│   └── assets
│
├── reports/
│   ├── Business_Insights_Report.docx
│   ├── Final_Project_Report.docx
│   └── individual_reports
│
└── README.md
```

---

# Phase 1: Data Cleaning & Preprocessing

### Activities Performed

* Dataset exploration
* Missing value identification and handling
* Duplicate record removal
* Datatype conversion
* Invoice date transformation
* Customer ID standardization
* Cancelled transaction removal
* Invalid quantity and price removal
* Text standardization
* Outlier detection using IQR
* Feature engineering

### New Features Created

* TotalPrice
* Year
* Month
* Day
* DayName
* Hour

### Techniques Applied

* Missing Value Handling
* Duplicate Removal
* Datatype Conversion
* Outlier Detection
* Feature Engineering
* Text Standardization

---

# Phase 2: Exploratory Data Analysis (EDA)

### Analysis Performed

* Revenue trend analysis
* Monthly sales analysis
* Customer behavior analysis
* Product performance analysis
* Country-wise revenue analysis
* Weekday sales analysis
* Shopping hour analysis
* Revenue distribution analysis

### Key Findings

* Revenue increased steadily throughout the year.
* Month 11 generated the highest revenue.
* The United Kingdom dominated overall sales.
* A small number of customers contributed significantly to total revenue.
* Peak shopping activity occurred during midday hours.

---

# Phase 3: Relational Database Design

The retail dataset was normalized into relational tables to improve structure, maintainability, and query performance.

### Products_Retaildb

* StockCode (Primary Key)
* Description

### Invoices_Retaildb

* InvoiceNo (Primary Key)
* InvoiceDate
* CustomerID
* Country
* Year
* Month
* Day
* DayName
* Hour

### Sales_Retaildb

* SaleID (Primary Key)
* InvoiceNo (Foreign Key)
* StockCode (Foreign Key)
* Quantity
* UnitPrice
* TotalPrice

---

# Phase 4: SQL Analytics

### SQL Operations Performed

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* HAVING
* INNER JOIN
* Aggregate Functions

### Aggregate Functions Used

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* DISTINCT()

### Business Analysis Conducted

* Revenue Analysis
* Product Performance Analysis
* Country-wise Sales Analysis
* Customer Analysis
* Monthly Trend Analysis
* Daily Trend Analysis
* Peak Hour Analysis

---

# Phase 5: Power BI Dashboard

## KPI Cards

* Total Revenue
* Total Transactions
* Total Customers
* Total Products

## Dashboard Visualizations

1. Monthly Revenue Trend
2. Monthly Transactions
3. Top 10 Products by Revenue
4. Top 10 Countries by Revenue
5. Revenue by Weekday
6. Peak Shopping Hours
7. Revenue Share by Top 5 Countries
8. Top Customers by Revenue

## Interactive Features

* Country Slicer
* Month Slicer
* Dynamic KPI Updates
* Cross-Filtering Across Visuals

---

# Key Business Insights

### Revenue Insights

* Revenue demonstrated consistent growth throughout the year.
* Month 11 generated the highest overall revenue.

### Customer Insights

* Customer ID 14911 generated the highest revenue.
* A small customer segment contributed a significant portion of total sales.

### Product Insights

* The highest-performing product generated approximately £35K revenue.
* Product sales were concentrated among a limited group of products.

### Geographic Insights

* The United Kingdom generated the majority of overall revenue.
* Revenue from the UK significantly exceeded other countries.

### Time-Based Insights

* Thursday generated the highest weekday revenue.
* Sunday generated comparatively lower revenue.
* Customer activity peaked during midday shopping hours.

---

# Business Recommendations

* Strengthen customer retention initiatives.
* Promote top-performing products through targeted campaigns.
* Focus marketing efforts during peak shopping hours.
* Expand sales strategies to additional international markets.
* Reduce dependence on a single geographic market.
* Utilize seasonal marketing campaigns before peak sales periods.

---

# Dashboard Preview

Dashboard screenshots are available in the repository under:

```text
dashboard/assets/
```

The dashboard provides an interactive view of:

* Revenue Performance
* Customer Behavior
* Product Analytics
* Country-wise Analysis
* Time-based Trends
* Business KPIs

---

# Project Outcomes

The project successfully transformed raw retail transaction data into actionable business intelligence through:

* Data Cleaning
* Exploratory Data Analysis
* SQL Analytics
* Database Design
* Power BI Dashboarding
* Business Insight Generation

The final solution enables efficient monitoring of retail performance and supports data-driven decision-making.

---

# Project Status

✅ Data Cleaning & Preprocessing Completed

✅ Exploratory Data Analysis Completed

✅ Relational Database Design Completed

✅ SQL Analytics Completed

✅ Power BI Dashboard Completed

✅ Business Insights Generated

✅ Documentation Completed

✅ GitHub Version Control Maintained

### Status: Project Successfully Completed

---

# Acknowledgement

This project was completed as part of the Data Analytics Internship Program at Infotact Solutions and demonstrates the practical application of data analytics, business intelligence, and visualization techniques in solving real-world retail business problems.
