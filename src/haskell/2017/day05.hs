main :: IO ()
main = do
    input <- getContents
    let offsets = map (read :: String -> Int) $ lines input
    print (steps offsets 0 0)

steps :: [Int] -> Int -> Int -> Int
steps offsets cur acc
    | cur >= length offsets = acc
    | cur < 0               = acc
    | otherwise             = steps (incr cur offsets) nxt (acc + 1)
    where rotate 0 xs    = xs
          rotate n xs    = take (length xs) $ drop n $ cycle xs
          incr 0 (x:xs)  = (x + 1):xs
          incr n xs      = rotate (length xs - n) $ (incr 0) $ rotate n xs
          nxt            = cur + (head . (rotate cur)) offsets

