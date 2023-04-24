-- Ej 11
eAprox :: Integer -> Float
eAprox n
    | n == 0    = 1
    | otherwise = 1/fromInteger(factorial n) + eAprox (n-1)


factorial :: Integer -> Integer
factorial n
    | n == 0    = 1
    | otherwise = n * factorial (n-1)

e :: Float
e = eAprox 10