# Importa tu Helper para la conexión a la base de datos
from db.Helper import Helper

class VentasDao(object):
    __db = None

    def __init__(self):
        # Inicializa la conexión a la base de datos
        self.__db = Helper()

    def selectVentas(self):
        # Recupera todas las ventas de la base de datos
        ventas = self.__db.query("SELECT * FROM ventas", None).fetchall()
        print("\nLista de Ventas:")
        for venta in ventas:
            print(venta)

    def insertVenta(self, venta):
        # Inserta una nueva venta utilizando el stored procedure correspondiente
        query = "CALL insertar_venta(%s, %s, %s, %s)"
        params = (venta.id, venta.total, venta.id_local, venta.id_cliente)
        self.__db.transacction(query, params)

    def updateVenta(self, venta):
        # Actualiza una venta utilizando el stored procedure correspondiente
        query = "CALL modificar_venta(%s, %s, %s, %s)"
        params = (venta.id, venta.total, venta.id_local, venta.id_cliente)
        self.__db.transacction(query, params)

    def deleteVenta(self, id_venta):
        # Elimina una venta utilizando el stored procedure correspondiente
        query = "CALL eliminar_venta(%s)"
        params = (id_venta,)
        self.__db.transacction(query, params)
