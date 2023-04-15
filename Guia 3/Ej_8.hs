comparar :: Integer ->Integer ->Integer
comparar x y
    | sumaUltimosDosDigitos x < sumaUltimosDosDigitos y = 1
    | sumaUltimosDosDigitos x > sumaUltimosDosDigitos y = -1
    | otherwise = 0


sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = mod x 10 + mod (div x 10) 10