-- Ej 2
parteEntera :: Float -> Integer
parteEntera x
    | x < 1    = 0
    | otherwise= 1 + parteEntera (x-1)