import sqlite3
import pandas as pd

conn = sqlite3.connect("data/database/world_cup.db")

tabelas = pd.read_sql(
    "SELECT name FROM sqlite_master WHERE type='table';",
    conn
)

print(tabelas)

conn.close()