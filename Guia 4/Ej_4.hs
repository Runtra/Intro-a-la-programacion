-- Ej 4

-- Suma los primeros n impares
sumaImpares :: Integer -> Integer
sumaImpares n
    | n == 1    = 1
    | otherwise = 2*n - 1 + sumaImpares (n-1)

-- pattern maching
sumaImpares_pm :: Integer -> Integer
sumaImpares_pm 1 = 1
sumaImpares_pm n = 2*n - 1 + sumaImpares_pm(n-1)