-- Ej 12

sucesionA :: Integer -> Float
sucesionA n
    | n == 1    = 2
    | otherwise = 2 + 1/(sucesionA (n-1))

raizDe2Aprox :: Integer ->Float
raizDe2Aprox n = sucesionA n - 1