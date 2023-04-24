-- Ej 10

-- Ejercicio A
f1 :: Integer -> Integer
f1 n
    | n == 0    = 1
    | otherwise = 2^n + f1 (n-1)


-- Ejercicio B
f2 :: Integer -> Float -> Float
f2 n q
    | n == 1    = q
    | otherwise = q^n + f2 (n-1) q


-- Ejercicio C
f3 :: Integer -> Float -> Float
f3 n q
    | n == 0    = 0
    | otherwise = q^(2*n) + q ^ (2*n-1) + f3 (n-1) q


-- Ejercicio D
f4 :: Integer -> Float -> Float
f4 n q
    | n == 0    = 1
    | n == 1    = q + q*q           -- Si a f2 le llega 0 _ se indefine
    |otherwise  = f3 n q - f2 (n-1) q