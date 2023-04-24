-- Ej 8

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
    | i == cantidadDigitos n = mod n 10
    | otherwise = (n `div` 10^((cantidadDigitos n) - i)) `mod` 10

iesimoDigito_rec :: Integer -> Integer -> Integer
iesimoDigito_rec n i
    | i == cantidadDigitos n    = mod n 10
    | otherwise                 = iesimoDigito_rec (div n 10) i

cantidadDigitos :: Integer -> Integer
cantidadDigitos n
    | n < 10    = 1
    | otherwise = 1 + cantidadDigitos (div n 10)