-- Ej 17

esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacci_aux n 0

esFibonacci_aux :: Integer -> Integer -> Bool
esFibonacci_aux n i 
    | n == 2 || n == 3  = True
    | n == fibonacci i  = True
    | n == i            = False
    | otherwise         = esFibonacci_aux n (i+1)

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)