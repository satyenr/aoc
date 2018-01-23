module AOC.Utils (rotate) where

rotate :: Int -> [a] -> [a]
rotate n xs 
    | n == 0    = xs
    | n == len  = xs
    | otherwise = take len $ drop n $ cycle xs
    where len = length xs