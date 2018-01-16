main :: IO ()
main = do
    input <- getContents
    let offsets = map (read :: String -> Int) $ lines input
    print (steps offsets (+ 1) 0 0)
    print (steps offsets (\x -> if x >= 3 then x - 1 else x + 1) 0 0)

-- Slow version using immutable data structures
-- Takes forever for any non-trivial input
steps :: [Int] -> (Int -> Int) -> Int -> Int -> Int
steps offsets fn cur acc
    | cur >= length offsets = acc
    | cur < 0               = acc
    | otherwise             = steps (mut cur fn offsets) fn nxt (acc + 1)
    where nxt            = cur + (head . (rotate cur)) offsets
          mut _ _ []     = []
          mut 0 f (x:xs) = (f x):xs
          mut n f xs     = rotate (length xs - n) $ (mut 0 f) $ rotate n xs
          rotate 0 ys    = ys
          rotate n ys    = take (length ys) $ drop n $ cycle ys