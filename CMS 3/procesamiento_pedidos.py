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
  
  pedidos_procesados : List[Dict[str, Union[int, str, float, Dict[str, int]]]] = []

  while not pedidos.empty():
    pedido_recibido : Dict[str, Union[int, str, Dict[str, int]]] = pedidos.get()
    productosPedidos : Dict[str,int] = pedido_recibido["productos"] # type: ignore

    pedido_preocesado : Dict[str, Union[int, str, float, Dict[str, int]]] = dict()
    precio : float = 0
    estado : str = "completo"
    for keyProducto in productosPedidos.keys():
      # Actualizar productos segun el stock
      if stock_productos[keyProducto] < productosPedidos[keyProducto]:
        productosPedidos[keyProducto] = stock_productos[keyProducto]
        stock_productos[keyProducto]  = 0
        estado = "incompleto"
      else:
        stock_productos[keyProducto]  = stock_productos[keyProducto] - productosPedidos[keyProducto]

      # Calcular el precio de los productos
      precio += precios_productos[keyProducto] * productosPedidos[keyProducto]
    
    pedido_preocesado["id"] = pedido_recibido["id"]
    pedido_preocesado["cliente"] = pedido_recibido["cliente"]
    pedido_preocesado["productos"] = productosPedidos
    pedido_preocesado["precio_total"] = precio
    pedido_preocesado["estado"] = estado


    pedidos_procesados.append(pedido_preocesado)

  return pedidos_procesados


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