import json
import os

# Obtener la ruta del directorio actual del script
current_directory = os.path.dirname(__file__)

# Combinar la ruta del directorio actual con la ruta del archivo de configuración
config_path = os.path.join(current_directory, '..','config.json')

config = {}

with open(config_path) as f:
    config = json.load(f)