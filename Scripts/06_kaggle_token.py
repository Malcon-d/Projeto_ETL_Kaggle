from dotenv import load_dotenv
import os

load_dotenv()

token = os.getenv("KAGGLE_API_TOKEN")

print(token[:8] + "...")