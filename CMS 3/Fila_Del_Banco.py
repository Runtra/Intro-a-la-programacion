from queue import Queue

# El tipo de fila debería ser Queue[int], pero la versión de python del CMS no lo soporta. Usaremos en su lugar simplemente "Queue"
# Forma correcta:
# def avanzarFila(fila: "Queue[int]", min: int):
def avanzarFila(fila: Queue, min: int):
  proximoCliente : int = fila.qsize() + 1


  tiempoSalida : int = -4
  clienteEnViaje : int = -1 # Si se mete -1 en la fila hay problemas pero al linter no le gustaba que este unbound.
  
  #Son las 10:00
  for minuto in range(0,min+1):

    # Llega un cliente cada 4 minutos
    if minuto % 4  == 0:
      fila.put(proximoCliente)
      proximoCliente += 1
    
    if minuto - tiempoSalida == 3:
      fila.put(clienteEnViaje)
    
    # Si despues de poder agregar a alguien esta vacia pasa al proximo minuto
    if fila.empty():
      continue

    # Avanza la caja 1
    if minuto % 10 == 1:
       _ = fila.get() 

    # Avanza la caja 2
    if minuto % 4 == 3:
       _ = fila.get() 

    # Avanza la caja 3
    if minuto % 4 == 2:
      tiempoSalida = minuto
      clienteEnViaje : int = fila.get()


if __name__ == '__main__':
  fila: Queue = Queue()
  fila_inicial: int = int(input())
  for numero in range(1, fila_inicial+1):
    fila.put(numero)
  min: int = int(input())
  avanzarFila(fila, min)
  res = []
  for i in range(0, fila.qsize()):
    res.append(fila.get())
  print(res)


# Caja1: Empieza a atender 10:01, y atiende a una persona cada 10 minutos
# Caja2: Empieza a atender 10:03, atiende a una persona cada 4 minutos
# Caja3: Empieza a atender 10:02, y atiende una persona cada 4 minutos, pero no le resuelve el problema y la persona debe volver a la fila (se va al final y tarda 3 min en llegar. Es decir, la persona que fue atendida 10:02 vuelve a entrar a la fila a las 10:05)
# La fila empieza con las n personas que llegaron antes de que abra el banco. Cuando abre (a las 10), cada 4 minutos llega una nueva persona a la fila (la primera entra a las 10:00)

