module AOC.Y2017.Day05 (result) where

import AOC.Utils (rotate)    

result :: String -> (String, String)
result input =
    let offsets = map (read :: String -> Int) $ lines input
        one = show $ steps offsets (+ 1) 0 0
        two = show $ steps offsets (\x -> if x >= 3 then x - 1 else x + 1) 0 0
    in (one, two)

-- Slow version using immutable data structures
-- Takes forever for any non-trivial input - especially the second part
steps :: [Int] -> (Int -> Int) -> Int -> Int -> Int
steps offsets fn cur acc
    | cur >= length offsets = acc
    | cur < 0               = acc
    | otherwise             = steps (mut cur fn offsets) fn nxt (acc + 1)
    where nxt            = cur + (head . (rotate cur)) offsets
          mut _ _ []     = []
          mut 0 f (x:xs) = (f x):xs
          mut n f xs     = rotate (length xs - n) $ (mut 0 f) $ rotate n xs