-- Ejercicio A
absoluto :: Int -> Int
absoluto n  | n >= 0 = n
            | otherwise = n * (-1)

-- Ejercicio B
maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y | absoluto x > absoluto y = absoluto x
                   | otherwise = absoluto y

-- Ejercicio C
maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z | x >= y && x >= z = x
              | y >= x && y >= z = y
              | z >= x && z >= y = z

-- Ejercicio D
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | x == 0 || y == 0 = True
              | otherwise = False

-- Ejercicio D (pattern matching)
algunoEs0_pm :: (Float, Float) -> Bool
algunoEs0_pm (0,_) = True
algunoEs0_pm (_,0) = True
algunoEs0_pm (_,_) = False

-- Ejercicio E
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False

-- Ejercicio E (pattern matching)
ambosSon0_pm :: (Float, Float) -> Bool
ambosSon0_pm (0,0) = True
ambosSon0_pm (_,_) = False

-- Ejercicio F
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | x <= 3 && y <= 3 = True
                   | x > 7  && y > 7  = True
                   | (x > 3 && x <= 7) && (y > 3 && y <= 7) = True
                   | otherwise = False

-- Ejercicio G
--sumaDistintos :: Int -> Int -> Int -> Int
--sumaDistintos x y z | x /= y && x /= z && x /= z = 0

-- Ejercicio H
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False

-- Ejercicio I
-- digitoUnidades: dado un numero natural, extrae su digito de las unidades.
digitoUnidades_r :: Int -> Int
digitoUnidades_r x  | absoluto x < 10 = absoluto x
                    | otherwise = digitoUnidades_r (absoluto x - 10)

digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10

-- Ejercicio J
-- digitoDecenas: dado un numero natural, extrae su digito de las decenas.
digitoDecenas :: Int -> Int
digitoDecenas x = mod (div x 10) 10
