import requests
import json

response = requests.get(f"{url}?apikey={api_key}")
data = response.json()

with open("sp500.json", "w") as f:
    json.dump(data, f)
