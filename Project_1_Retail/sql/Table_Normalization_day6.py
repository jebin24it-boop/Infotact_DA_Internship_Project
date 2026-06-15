#Converting the database from a single table into multiple tables -- Normalization

# Working Environment - VS Code, Sqlite using SQLTools Extension
import pandas as pd
import sqlite3

csv_path = "D:\\Saurav-Sql\\Infotact_DA_Internship_Project\\Project_1_Retail\\sql\\final_cleaned_retail_dataset.csv"
df = pd.read_csv(csv_path)

# PHASE 1: PREPARE DATAFRAMES
products_df = df[['StockCode', 'Description']].drop_duplicates(subset=['StockCode'])

invoices_df = df[[
    'InvoiceNo', 'InvoiceDate', 'CustomerID', 'Country',
    'Year', 'Month', 'Day', 'DayName', 'Hour'
]].drop_duplicates(subset=['InvoiceNo'])

sales_df = df[['InvoiceNo', 'StockCode', 'Quantity', 'UnitPrice', 'TotalPrice']]

# PHASE 2: CREATE TABLES
conn = sqlite3.connect("Retaildb_Project.db")
cursor = conn.cursor()
cursor.execute("PRAGMA foreign_keys = ON;")
cursor.execute("DROP TABLE IF EXISTS Sales_Retaildb;")
cursor.execute("DROP TABLE IF EXISTS Invoices_Retaildb;")
cursor.execute("DROP TABLE IF EXISTS Products_Retaildb;")
conn.commit()


cursor.execute("""
CREATE TABLE IF NOT EXISTS Products_Retaildb (
    StockCode TEXT PRIMARY KEY,
    Description TEXT
);""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Invoices_Retaildb (
    InvoiceNo TEXT PRIMARY KEY,
    InvoiceDate TEXT,
    CustomerID TEXT,
    Country TEXT,
    Year INTEGER,
    Month INTEGER,
    Day INTEGER,
    DayName TEXT,
    Hour INTEGER
);""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Sales_Retaildb (
    SaleID INTEGER PRIMARY KEY AUTOINCREMENT,
    InvoiceNo TEXT,
    StockCode TEXT,
    Quantity INTEGER,
    UnitPrice REAL,
    TotalPrice REAL,
    FOREIGN KEY (InvoiceNo) REFERENCES Invoices_Retaildb(InvoiceNo),
    FOREIGN KEY (StockCode) REFERENCES Products_Retaildb(StockCode)
);""")

conn.commit()

# PHASE 3: POPULATE TABLES
cursor.execute("DELETE FROM Sales_Retaildb;")
cursor.execute("DELETE FROM Invoices_Retaildb;")
cursor.execute("DELETE FROM Products_Retaildb;")
conn.commit()

products_df.to_sql("Products_Retaildb", conn, if_exists="append", index=False)
invoices_df.to_sql("Invoices_Retaildb", conn, if_exists="append", index=False)
sales_df.to_sql("Sales_Retaildb", conn, if_exists="append", index=False)

conn.close()
print("✅ Success! 3 tables created perfectly.")