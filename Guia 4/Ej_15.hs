-- Ej 15

sumaRacionalesInterna :: Integer -> Integer -> Double
sumaRacionalesInterna p m
    | m == 0    = 0
    | otherwise = x / y + sumaRacionalesInterna p (m-1)
    where 
        x = fromIntegral p
        y = fromIntegral m

sumaRacionales :: Integer -> Integer -> Double
sumaRacionales n m
    | n == 0    = 0
    | otherwise = sumaRacionalesInterna n m + sumaRacionales (n-1) m