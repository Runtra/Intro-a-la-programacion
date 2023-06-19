from typing import List
from typing import Dict
import json

# Decia -> Dict[str,List[str]]
def unir_diccionarios(a_unir: List[Dict[str,int]]) -> Dict[str,List[int]]:
  tempDict : Dict[str,List[int]] = dict()

  for i in range(len(a_unir)):
    for key in a_unir[i].keys():
      valores : List[int] = [a_unir[i][key]]
      if key in tempDict.keys():
        valores = tempDict[key] + valores
      tempDict.update( {key : valores})
  return tempDict


if __name__ == '__main__':
  x = json.loads(input()) # Ejemplo de input: [{"a":2},{"b":3,"a":1}]
  print(unir_diccionarios(x))