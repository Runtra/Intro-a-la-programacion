-- Ej 7

-- Mio
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | n < 10 = True
    | not (ultimosDosDigitosIguales n) = False
    | n < 100 = ultimosDosDigitosIguales n
    | ultimosDosDigitosIguales n = todosDigitosIguales (div n 10)  


ultimosDosDigitosIguales :: Integer -> Bool
ultimosDosDigitosIguales n = digitoDecenas n == digitoUnidades n

digitoUnidades :: Integer -> Integer
digitoUnidades x = mod x 10

digitoDecenas :: Integer -> Integer
digitoDecenas x = mod (div x 10) 10


-- Clase
-- Es mas simple che alto bolonqui me hice yo
todosDigitosIguales_alt :: Integer -> Bool
todosDigitosIguales_alt n
    | n == ultimoDigito n   = True
    | otherwise             = ultimoDigito n == ultimoDigito(div n 10) && todosDigitosIguales_alt (div n 10)
-- compara si los dos ultimos digitos son iguales y si los ultimos dos digitos de el numero dividido 10 son iguales

ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10