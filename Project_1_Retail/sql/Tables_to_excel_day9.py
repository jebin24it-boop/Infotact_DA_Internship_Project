import sqlite3
import pandas as pd

# Connect to SQLite database
db_connection = sqlite3.connect('Retaildb_Project.db')

# Load SQL tables into DataFrames
df_sales = pd.read_sql_query(
    "SELECT * FROM Sales_Retaildb;",
    db_connection
)

df_invoices = pd.read_sql_query(
    "SELECT * FROM Invoices_Retaildb;",
    db_connection
)

df_products = pd.read_sql_query(
    "SELECT * FROM Products_Retaildb;",
    db_connection
)

# Output Excel filename
output_filename = "Infotact_Retail_Normalized_Data.xlsx"

# Export tables into separate Excel sheets
with pd.ExcelWriter(output_filename, engine='openpyxl') as writer:
    
    df_sales.to_excel(
        writer,
        sheet_name='Sales_Data',
        index=False
    )

    df_invoices.to_excel(
        writer,
        sheet_name='Invoices_Data',
        index=False
    )

    df_products.to_excel(
        writer,
        sheet_name='Products_Data',
        index=False
    )

# Close database connection
db_connection.close()

print(f"Success! '{output_filename}' created successfully.")