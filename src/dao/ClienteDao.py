# Se importa el Helper
from db.Helper import Helper

class ClienteDao(object):
    __db = None

    def __init__(self):
        # Se crean los objetos __db y cliente, para la conección con la base de datos y con la tabla respectivamente
        self.__db = Helper()

    def selectClientes(self):
        """
        Función que selecciona todos los clientes de la base de datos y los imprime en la consola.
        """
        clientes = self.__db.query("SELECT * FROM clientes", None).fetchall()
        print("\nLista de Clientes:")
        for cliente in clientes:
            print(cliente)
    
    def insertCliente(self, cliente):
        """
        Función que inserta un cliente en la base de datos.
        
        Args:
        - cliente: objeto cliente a insertar en la base de datos.
        """
        query = "INSERT INTO clientes (id, nombre, idGenero, telefono) VALUES (%s, %s, %s, %s)"
        params = (cliente.id, cliente.nombre, cliente.idGenero, cliente.telefono)
        self.__db.transaction(query, params)

    def updateCliente(self, id_cliente, nombre, id_genero, telefono):
        """
        Función que actualiza un cliente en la base de datos.
        
        Args:
        - id_cliente: identificador del cliente a actualizar.
        - nombre: nuevo nombre del cliente.
        - id_genero: nuevo identificador de género del cliente.
        - telefono: nuevo número de teléfono del cliente.
        """
        query = "UPDATE clientes SET nombre=%s, idGenero=%s, telefono=%s WHERE id=%s"
        params = (nombre, id_genero, telefono, id_cliente)
        self.__db.transaction(query, params)

    def deleteCliente(self, id_cliente):
        """
        Función que elimina un cliente de la base de datos.
        
        Args:
        - id_cliente: identificador del cliente a eliminar.
        """
        query = "DELETE FROM clientes WHERE id=%s"
        params = (id_cliente,)
        self.__db.transaction(query, params)
