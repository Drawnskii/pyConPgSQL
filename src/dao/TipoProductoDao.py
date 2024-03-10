# Se importa el Helper
from db.Helper import Helper

class TipoProductoDao(object):
    __db = None

    def __init__(self):
        # Se crean los objetos __db y cliente, para la conección con la base de datos y con la tabla respectivamente
        self.__db = Helper()

    def selectTiposProductos(self):
        tipoProdutco = self.__db.query("SELECT * FROM tipos_productos", None).fetchall()
        print("\nLista de Tipos de Productos:")
        for tipoProdutco in tipoProdutco:
            print(tipoProdutco)
    
    # Función que inserta un cliente a la bdd mediante el método transacction
    def insertTiposProductos(self, tipoProducto):
        query = "INSERT INTO tipos_productos (id, nombre) VALUES (%s, %s)"
        params = (tipoProducto.id, tipoProducto.nombre)
        self.__db.transacction(query, params)

    def updateTipoProducto(self, tipoProducto):
        # Actualiza el nombre de un tipo de producto en la base de datos
        query = "UPDATE tipos_productos SET nombre = %s WHERE id = %s"
        params = (tipoProducto.nombre, tipoProducto.id)
        self.__db.transacction(query, params)

    def deleteTipoProducto(self, idTipoProducto):
        # Elimina un tipo de producto de la base de datos
        query = "DELETE FROM tipos_productos WHERE id = %s"
        params = (idTipoProducto,)
        self.__db.transacction(query, params)