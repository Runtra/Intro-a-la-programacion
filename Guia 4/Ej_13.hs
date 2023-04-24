-- Ejercicio 13

-- f :: Integer -> Integer -> Integer

sumatoriaInterna_pm :: Integer -> Integer -> Integer
sumatoriaInterna_pm _ 0 = 0
sumatoriaInterna_pm x m = x ^ m + sumatoriaInterna_pm x (m-1)

sumatoriaDoble_pm :: Integer -> Integer -> Integer
sumatoriaDoble_pm 0 _ = 0
sumatoriaDoble_pm n m = sumatoriaInterna_pm n m + sumatoriaDoble_pm (n-1) m


sumatoriaInterna :: Integer -> Integer -> Integer
sumatoriaInterna x m
    | m == 1    = x
    | otherwise = x ^ m + sumatoriaInterna x (m-1)

sumatoriaDoble :: Integer -> Integer -> Integer
sumatoriaDoble n m
    | n == 0    = 0
    | otherwise = sumatoriaInterna n m + sumatoriaDoble (n-1) m

    