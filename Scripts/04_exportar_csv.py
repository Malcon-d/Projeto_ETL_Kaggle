from pathlib import Path
import sqlite3
import pandas as pd

# Caminhos
BANCO = Path("Data/database/world_cup.db")
PASTA_SAIDA = Path("Data/output")

# Cria a pasta caso não exista
PASTA_SAIDA.mkdir(parents=True, exist_ok=True)

conn = sqlite3.connect(BANCO)

views = [
    "vw_artilharia",
    "vw_dashboard_equipes",
    "vw_eventos",
    "vw_man_of_the_match",
    "vw_partidas",
    "partidas_completas"
]

for view in views:
    df = pd.read_sql(f"SELECT * FROM {view}", conn)
    df.to_csv(PASTA_SAIDA / f"{view}.csv", index=False)

conn.close()    

print("Arquivos exportados com sucesso!")
print(BANCO.resolve())