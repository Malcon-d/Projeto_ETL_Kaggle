@echo off

cd /d "%~dp0"

set KAGGLE_API_TOKEN=KGAT_07323c733285400ca1475eef265b11aa

".venv\Scripts\python.exe" "Scripts\05_update_pipeline.py"

pause