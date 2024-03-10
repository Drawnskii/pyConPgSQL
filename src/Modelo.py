# Clases para crear instancias para consultas
class Cliente:
    def __init__(self, id=None, nombre=None, idGenero=None, telefono=None):
        self.id = id
        self.nombre = nombre
        self.idGenero = idGenero
        self.telefono = telefono

class TipoProduto:
    def __init__(self, id=None, nombre=None):
        self.id = id
        self.nombre = nombre

class Ventas:
    def __init__(self, id=None, total=None, id_local=None, id_cliente=None):
        self.id=id
        self.total=total
        self.id_local=id_local
        self.id_cliente=id_cliente