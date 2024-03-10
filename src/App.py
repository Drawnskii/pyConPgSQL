# Se importan los formularios
from forms.frmTiposProductos import frmTiposProductos
from forms.frmClientes import frmClientes
from forms.frmVentas import frmVentas

class App(object):
    # Función para inicializar la aplicación
    def __init__(self):
        self.frmTP = frmTiposProductos()
        self.frmClientes = frmClientes()
        self.frmVentas = frmVentas()  # Agrega el formulario de ventas

        print("SISTEMA ABC DE VENTAS")

        while True:
            # Mostrar opciones al usuario
            print("\n1. Tabla de Tipos de Productos")
            print("2. Tabla de Clientes")
            print("3. Tabla de Ventas")  # Nueva opción para la tabla de ventas
            print("5. Salir\n")
            
            opcion = input("Ingrese su opción (1-5): ")
    
            try:
                opcion = int(opcion)
            except ValueError:
                print("\n¡Solo se pueden ingresar números enteros!")
                continue

            # Control para manejar la selección de las opciones
            if opcion == 1:
                self.frmTP.inicializarTablaTiposProductos()
            elif opcion == 2:
                self.frmClientes.inicializarTablaClientes()
            elif opcion == 3:
                self.frmVentas.inicializarTablaVentas()  # Inicia el formulario de ventas
            elif opcion == 5:
                print("\nSaliendo del programa...")
                break
            else:
                print("\n¡Opción no válida!")

if __name__ == "__main__":
    app = App()
