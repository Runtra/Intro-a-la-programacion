f :: Int -> Int
f 1 = 8
f 4 = 131
f 16 = 16

g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

fog :: Int -> Int
fog n = f (g n)

gof :: Int -> Int
gof n = g (f n)
