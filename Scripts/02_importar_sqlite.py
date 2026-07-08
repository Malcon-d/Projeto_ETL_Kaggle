from pathlib import Path
import pandas as pd
import sqlite3
import os 

#Caminhos
def main():
    PASTA_CSV = Path("data/raw")
    BANCO = Path("data/database/world_cup.db")

    # Cria a pasta do banco caso não exista
    BANCO.parent.mkdir(parents=True, exist_ok=True)

    if BANCO.exists():
        os.remove(BANCO)

    # Conecta ao SQLite
    conn = sqlite3.connect(BANCO)

    # Percorre todos os CSVs da pasta
    for arquivo in PASTA_CSV.glob("*.csv"):

        print(f'importando {arquivo.name}')

        df = pd.read_csv(arquivo)

        # nome da tabela
        nome_tabela = arquivo.stem

        df.to_sql(
            nome_tabela,
            conn,
            if_exists="replace",
            index=False
        )

        # print da tabela e a quantidad de arquivos
        print(f'A tabela {nome_tabela} foi executada com {len(df)} registros')

    # fecha a conexao
    conn.close()

    print('\nImportação de arquivos concluidos!')

if __name__ == "__main__":
    main()