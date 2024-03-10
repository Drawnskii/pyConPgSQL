# Se importan los Dao
from dao.TipoProductoDao import TipoProductoDao

# Se importan la clases desde Modelo
from Modelo import TipoProduto

class frmTiposProductos(object):
    # Funció para inicializar la app
    def inicializarTablaTiposProductos(self):
        self.tpDao = TipoProductoDao()

        print("\nTipos de Productos")

        while True:
            
            # Mostrar opciones al usuario
            print("\n1. Obtener tipo de productos")
            print("2. Agregar tipo de productos")
            print("3. Actualizar tipo de producto")
            print("4. Eliminar tipo de produto")
            print("5. Salir de la Tabla Tipos de Producto\n")
            
            opcion = input("Ingrese su opción (1-5): ")
    
            try:
                opcion = int(opcion)
            except ValueError:
                print("\n¡Solo se pueden ingresar números enteros!")
                continue

            # Control para manejar la selección de las opciones
            if opcion == 1:
                self.listarTiposProductos()
            elif opcion == 2:
                self.agregarTipoProducto()
            elif opcion == 3:
                self.actualizarTipoProducto()
            elif opcion == 4:
                self.eliminarTipoProducto()
            elif opcion == 5:
                print("\nSaliendo del programa...")
                break
            else:
                print("\n¡Opción no válida!")

    # Funcion para listar los tipos de productos
    def listarTiposProductos(self):
        self.tpDao.selectTiposProductos()

    # Funciones para agregar nuevos mamíferos
    def agregarTipoProducto(self):
        tipoProducto = TipoProduto()
        tipoProducto.id = int(input("\nIngrese el ID del tipo de producto: "))
        tipoProducto.nombre = input("Ingrese el nombre del tipo de producto: ")
        self.tpDao.insertTiposProductos(tipoProducto)
        print("\nTipo de producto agregado correctamente.")

    # Función para actualizar un tipo de producto
    def actualizarTipoProducto(self):
        tipoProducto = TipoProduto()
        tipoProducto.id = int(input("\nIngrese el ID del tipo de producto que desea actualizar: "))
        tipoProducto.nombre = input("Ingrese el nuevo nombre del tipo de producto: ")
        self.tpDao.updateTipoProducto(tipoProducto)
        print("\nTipo de producto actualizado correctamente.")

    # Función para eliminar un tipo de producto
    def eliminarTipoProducto(self):
        idTipoProducto = int(input("\nIngrese el ID del tipo de producto que desea eliminar: "))
        self.tpDao.deleteTipoProducto(idTipoProducto)
        print("\nTipo de producto eliminado con éxito.")