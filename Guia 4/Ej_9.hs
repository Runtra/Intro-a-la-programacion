-- Ej 9
esCapicua :: Integer ->Bool
esCapicua n
    | cantidadDigitos n == 1    = True
    | otherwise = iesimoDigito n 1 == iesimoDigito n (cantidadDigitos n) && esCapicua (sacarPrimerYUltimo n)

--  | iesimoDigito n 0 == iesimoDigito n (cantidadDigitos n) = esCapicua (sacarPrimerYUltimo n)


sacarPrimerYUltimo :: Integer -> Integer
sacarPrimerYUltimo n = (n `mod` (10^(cantidadDigitos n -1))) `div` 10
-- mod n 10 a la cantidad de digitos menos uno saca el primer digito
-- div 10 saca el ultimo

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
    | i == cantidadDigitos n    = mod n 10
    | otherwise                 = iesimoDigito (div n 10) i

cantidadDigitos :: Integer -> Integer
cantidadDigitos n
    | n < 10    = 1
    | otherwise = 1 + cantidadDigitos (div n 10)
