from queue import Queue
from typing import List
from typing import Dict
from typing import Union
import json

# ACLARACIÓN: El tipo de "pedidos" debería ser: pedidos: Queue[Dict[str, Union[int, str, Dict[str, int]]]]
# Por no ser soportado por la versión de CMS, usamos simplemente "pedidos: Queue"
def procesamiento_pedidos(pedidos: Queue,
                          stock_productos: Dict[str, int],
                          precios_productos: Dict[str, float]) -> List[Dict[str, Union[int, str, float, Dict[str, int]]]]:
  
  print(type(pedidos))
  res = []
  estado = 'completo'
  for cliente in pedidos:
    precio_items = 0
    for productos in cliente['productos']:
      if stock_productos[productos] >= cliente['productos'][productos]:
        stock_productos[productos] = stock_productos[productos] - cliente['productos'][productos]
        precio_items = precio_items + (precios_productos[productos] * cliente['productos'][productos])
      else:
        estado = 'incompleto'
        precio_items = precio_items + (stock_productos[productos] * precios_productos[productos])
        cliente['productos'][productos] = stock_productos[productos]
        stock_productos[productos] = 0
    cliente['precio_total'] = precio_items
    cliente['estado'] = estado
    res.append(cliente)
  print(stock_productos)  
  return res, stock_productos

if __name__ == '__main__':
  pedidos: Queue = Queue()
  list_pedidos = json.loads(input())
  [pedidos.put(p) for p in list_pedidos]
  stock_productos = json.loads(input())
  precios_productos = json.loads(input())
  print("{} {}".format(procesamiento_pedidos(pedidos, stock_productos, precios_productos), stock_productos))

# Ejemplo input  
# pedidos: [{"id":21,"cliente":"Gabriela", "productos":{"Manzana":2}}, {"id":1,"cliente":"Juan","productos":{"Manzana":2,"Pan":4,"Factura":6}}]
# stock_productos: {"Manzana":10, "Leche":5, "Pan":3, "Factura":0}
# precios_productos: {"Manzana":3.5, "Leche":5.5, "Pan":3.5, "Factura":5}