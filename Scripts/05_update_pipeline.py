from pathlib import Path
import subprocess
import sys

SCRIPTS = [
    "01_download_dataset.py",
    "02_importar_sqlite.py",
    "03_create_views.py",
    "04_exportar_csv.py"
]

PASTA_SCRIPTS = Path(__file__).parent

def executar(script):

    print(f"\n{'=' * 60}")
    print(f"Executando: {script}")
    print(f"{'=' * 60}")

    subprocess.run(
        [sys.executable, PASTA_SCRIPTS / script],
        check=True
    )


def main():

    print("\nIniciando atualização do projeto...\n")

    for script in SCRIPTS:
        executar(script)

    print("\nAtualização concluída com sucesso!")



if __name__ == "__main__":
    main()