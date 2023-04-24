-- Ej 3
esDivisible :: Integer -> Integer -> Bool
esDivisible x y
    | x == 0    = True
    | x < y     = False
    | x >= y     = esDivisible (x-y) y
    