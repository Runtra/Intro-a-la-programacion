-- Ej 16

-- Ejercicio A
menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisor_aux n 2

menorDivisor_aux :: Integer -> Integer -> Integer
menorDivisor_aux n i
    | mod n i == 0  = i
    | otherwise     = menorDivisor_aux n (i+1)


-- Ejercicio B
esPrimo :: Integer ->Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n


-- Ejercicio C
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos p q = sonCoprimos_aux p q 2

-- i >= 2
sonCoprimos_aux :: Integer -> Integer -> Integer -> Bool
sonCoprimos_aux p q i
    | mod p i == 0 &&  mod q i == 0 = False
    | p == i || q == i              = True
    | otherwise                     = sonCoprimos_aux p q (i+1)

-- Algoritmo de euclides
mcdEuclides :: Integer -> Integer -> Integer
mcdEuclides p q
    | q == 0    = p
    | otherwise = mcdEuclides q (mod p q)

sonCoprimosEuclides :: Integer -> Integer -> Bool
sonCoprimosEuclides p q = mcdEuclides p q == 1

-- Ejercicio D
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimo_aux n 2

nEsimoPrimo_aux :: Integer -> Integer -> Integer
nEsimoPrimo_aux n p 
    | esPrimo p && n == 1   = p
    | not (esPrimo p)       = nEsimoPrimo_aux n (p+1)
    | otherwise             = nEsimoPrimo_aux (n-1) (p+1)