# Recria as views que estao no SQL
from pathlib import Path
import sqlite3

BANCO = Path("Data/database/world_cup.db")
ARQUIVO_SQL = Path("SQL/views.sql")

conn = sqlite3.connect(BANCO)

with open(ARQUIVO_SQL, "r", encoding="utf-8") as f:
    sql = f.read()

conn.executescript(sql)

conn.commit()
conn.close()

print("Views criadas com sucesso!")
print(BANCO.resolve())