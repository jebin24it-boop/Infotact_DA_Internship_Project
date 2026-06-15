
# Code for converting Excel csv file into a database and then creating a table
import pandas as pd
import sqlite3

df = pd.read_csv("D:\\Saurav-Sql\\Infotact_DA_Internship_Project\\Project_1_Retail\\sql\\final_cleaned_retail_dataset.csv")

# Database Name - Sql_Database
conn = sqlite3.connect("RetailDB_Project.db")

# Table Name - Retail_Dataset
df.to_sql("Retail_Dataset", conn, if_exists="replace", index=False)
conn.close()
print("✅ Ready for SQL!")