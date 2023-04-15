-- False si (¬EsMultiplo(a˜no, 4) ∨ (EsMultiplo(a˜no, 100) ∧ ¬EsMultiplo(a˜no, 400))
bisiesto :: Integer -> Bool
bisiesto n
    | mod n 4 /= 0 = False
    | mod n 100 == 0 && mod n 400 /= 0 = False
    | otherwise = True