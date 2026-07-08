from kaggle.api.kaggle_api_extended import KaggleApi
from pathlib import Path 
import os 

api = KaggleApi()
api.authenticate()

# define as pastas de destino para os arquivos baixados
destino = Path("data/raw")
destino.mkdir(parents=True, exist_ok=True)

# remove os arquivos antigos e o glob pattern * para pegar todos os arquivos dentro da pasta destino
for arquivo in destino.glob("*"):
    if arquivo.is_file():
        os.remove(arquivo)

api.dataset_download_files(
    "mominullptr/fifa-world-cup-2026-dataset",
    path=destino,
    unzip=True
)

print("Download Concluído!")