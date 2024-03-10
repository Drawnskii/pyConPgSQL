# Se importan los Dao
from dao.ClienteDao import ClienteDao

# Se importan las clases desde Modelo
from Modelo import Cliente

class frmClientes(object):
    # Función para inicializar el formulario de clientes
    def inicializarTablaClientes(self):
        self.clienteDao = ClienteDao()

        print("\nClientes")

        while True:
            # Mostrar opciones al usuario
            print("\n1. Obtener lista de clientes")
            print("2. Agregar cliente")
            print("3. Actualizar cliente")
            print("4. Eliminar cliente")
            print("5. Salir del formulario de clientes\n")
            
            opcion = input("Ingrese su opción (1-5): ")
    
            try:
                opcion = int(opcion)
            except ValueError:
                print("\n¡Solo se pueden ingresar números enteros!")
                continue

            # Control para manejar la selección de las opciones
            if opcion == 1:
                self.listarClientes()
            elif opcion == 2:
                self.agregarCliente()
            elif opcion == 3:
                self.actualizarCliente()
            elif opcion == 4:
                self.eliminarCliente()
            elif opcion == 5:
                print("\nSaliendo del formulario de clientes...")
                break
            else:
                print("\n¡Opción no válida!")

    # Función para listar los clientes
    def listarClientes(self):
        self.clienteDao.selectClientes()

    # Función para agregar un nuevo cliente
    def agregarCliente(self):
        cliente = Cliente()
        cliente.id = int(input("\nIngrese el ID del cliente: "))
        cliente.nombre = input("Ingrese el nombre del cliente: ")
        cliente.idGenero = int(input("Ingrese el ID del género del cliente: "))
        cliente.telefono = input("Ingrese el número de teléfono del cliente: ")
        self.clienteDao.insertCliente(cliente)
        print("\nCliente agregado correctamente.")

    # Función para actualizar un cliente
    def actualizarCliente(self):
        cliente = Cliente()
        cliente.id = int(input("\nIngrese el ID del cliente que desea actualizar: "))
        cliente.nombre = input("Ingrese el nuevo nombre del cliente: ")
        cliente.idGenero = int(input("Ingrese el nuevo ID del género del cliente: "))
        cliente.telefono = input("Ingrese el nuevo número de teléfono del cliente: ")
        self.clienteDao.updateCliente(cliente)
        print("\nCliente actualizado correctamente.")

    # Función para eliminar un cliente
    def eliminarCliente(self):
        idCliente = int(input("\nIngrese el ID del cliente que desea eliminar: "))
        self.clienteDao.deleteCliente(idCliente)
        print("\nCliente eliminado con éxito.")
