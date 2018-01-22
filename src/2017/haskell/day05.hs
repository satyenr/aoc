import Utils (rotate)

main :: IO ()
main = do
    input <- getContents
    let offsets = map (read :: String -> Int) $ lines input

    -- Part 1
    print (steps offsets (+ 1) 0 0)

    -- Part 2
    print (steps offsets (\x -> if x >= 3 then x - 1 else x + 1) 0 0)

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