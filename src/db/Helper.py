# Importación de librerías
import psycopg2

# Importación de la configuración
from Config import config

class Helper:

    # Se cargan  los datos de acceso a postgreSQL
    def __init__(self):
        db_config = config['postgreSQL']
        self.__conn = psycopg2.connect(host = db_config['host'], user = db_config['user'], password = db_config['password'], port = db_config['port'], database = db_config['db'])
        self.__cursor = self.__conn.cursor()

    # Solo manejan consultas
    def query(self, query, params):
        self.__cursor.execute(query, params)
        return self.__cursor

    # Se separan las consultas (query) de las sentencias de que manipulan las tuplas (transacction)   
    def transacction(self, sql, params):
        self.__cursor.execute(sql, params)
        self.__conn.commit()

    def close(self):
        self.__conn.close()
