# Importa el DAO de Ventas
from dao.VentasDao import VentasDao

# Importa la clase Ventas del modelo
from Modelo import Ventas

class frmVentas(object):
    # Función para inicializar la aplicación
    def inicializarTablaVentas(self):
        self.ventasDao = VentasDao()

        print("\nVentas")

        while True:
            # Mostrar opciones al usuario
            print("\n1. Obtener ventas")
            print("2. Agregar venta")
            print("3. Actualizar venta")
            print("4. Eliminar venta")
            print("5. Salir de la Tabla de Ventas\n")
            
            opcion = input("Ingrese su opción (1-5): ")
    
            try:
                opcion = int(opcion)
            except ValueError:
                print("\n¡Solo se pueden ingresar números enteros!")
                continue

            # Control para manejar la selección de las opciones
            if opcion == 1:
                self.listarVentas()
            elif opcion == 2:
                self.agregarVenta()
            elif opcion == 3:
                self.actualizarVenta()
            elif opcion == 4:
                self.eliminarVenta()
            elif opcion == 5:
                print("\nSaliendo del programa...")
                break
            else:
                print("\n¡Opción no válida!")

    # Función para listar las ventas
    def listarVentas(self):
        self.ventasDao.selectVentas()

    # Función para agregar una nueva venta
    def agregarVenta(self):
        venta = Ventas()
        venta.id = int(input("\nIngrese el ID de la venta: "))
        venta.total = float(input("Ingrese el total de la venta: "))
        venta.id_local = int(input("Ingrese el ID del local: "))
        venta.id_cliente = int(input("Ingrese el ID del cliente: "))
        self.ventasDao.insertVenta(venta)
        print("\nVenta agregada correctamente.")

    # Función para actualizar una venta existente
    def actualizarVenta(self):
        venta = Ventas()
        venta.id = int(input("\nIngrese el ID de la venta que desea actualizar: "))
        venta.total = float(input("Ingrese el nuevo total de la venta: "))
        venta.id_local = int(input("Ingrese el nuevo ID del local: "))
        venta.id_cliente = int(input("Ingrese el nuevo ID del cliente: "))
        self.ventasDao.updateVenta(venta)
        print("\nVenta actualizada correctamente.")

    # Función para eliminar una venta
    def eliminarVenta(self):
        idVenta = int(input("\nIngrese el ID de la venta que desea eliminar: "))
        self.ventasDao.deleteVenta(idVenta)
        print("\nVenta eliminada con éxito.")
