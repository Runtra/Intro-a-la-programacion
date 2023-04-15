-- Ejercicio A
-- prodInt: calcula el producto interno entre dos tuplas R × R.
prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (ax, ay) (bx, by) = ax * bx + ay * by

-- Ejercicio B
-- todoMenor: dadas dos tuplas R × R, decide si es cierto que cada coordenada de la primera tupla
-- es menor a la coordenada correspondiente de la segunda tupla.
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (ax, ay) (bx, by) = ax < bx && ay < by

-- Ejercicio C
-- distanciaPuntos: calcula la distancia entre dos puntos de R2
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (ax, ay) (bx, by) = sqrt ((ax - bx)**2 + (ay - by)**2)

-- Ejercicio D
-- sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos.
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (a,b,c) = a + b + c

-- Ejercicio E
-- sumarSoloMultiplos: dada una terna de numeros enteros y un natural, calcula la suma
-- de los elementos de la terna que son multiplos del numero natural. 

-- a lo' bifes
sumarSoloMultiplos :: (Int,Int,Int) -> Int -> Int
sumarSoloMultiplos (a,b,c) n
    | mod a n == 0 && mod b n == 0 && mod c n == 0 = a + b + c
    | mod a n == 0 && mod b n == 0 = a + b
    | mod a n == 0 && mod c n == 0 = a + c
    | mod b n == 0 && mod c n == 0 = b + c
    | mod a n == 0 = a
    | mod b n == 0 = b
    | mod c n == 0 = c
    | otherwise = 0

-- Ejercicio F
posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (a,b,c)
    | mod a 2 == 0 = 0
    | mod b 2 == 0 = 1
    | mod c 2 == 0 = 2
    | otherwise = 4

-- Ejercicio G
-- crea un par a partir de sus dos componentes dadas por separado (debe funcionar para
-- elementos de cualquier tipo)

crearPar :: a ->b ->(a, b)
crearPar a b = (a,b)

-- Ejercicio H
-- convierte los elementos del par pasado como par ́ametro (debe funcionar para elementos
-- de cualquier tipo)
invertir :: (a, b) ->(b, a)
invertir (a,b) = (b,a)