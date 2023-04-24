-- Ej 14

sumatoriaPotInterno :: Integer -> Integer -> Integer -> Integer
sumatoriaPotInterno q a m
    | m == 0    = 0
    | otherwise = q ^ (a+m) + sumatoriaPotInterno q a (m-1)

sumatoriaPotDoble :: Integer -> Integer -> Integer -> Integer
sumatoriaPotDoble q n m
    | n == 0    = 0
    | otherwise = sumatoriaPotInterno q n m + sumatoriaPotDoble q (n-1) m