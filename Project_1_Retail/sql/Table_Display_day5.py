import pandas as pd
import sqlite3

# used to connect to the database
conn = sqlite3.connect("Retaildb_Project.db")

# Query to display the table
print(pd.read_sql_query("SELECT * FROM Retail_Dataset",conn))