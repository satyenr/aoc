import Data.List.Split (splitOn)

main :: IO ()
main = do
    input <- getContents
    let lengths = map (read :: String -> Int) $ splitOn "," input
    print (product $ take 2 $ partOne [0 .. 255] lengths 0 0)

partOne :: [Int] -> [Int] -> Int -> Int -> [Int]
partOne xs [] _ _ = xs
partOne xs len cur skip = partOne xs' len' cur' skip'
    where xs'         = rotate (lxs - cur) (reverse (take curlen (rotate cur xs)) ++ (drop curlen (rotate cur xs)))
          len'        = tail len
          cur'        = (cur + curlen + skip) `mod` lxs
          skip'       = skip + 1
          rotate n ys = take (length ys) $ drop n $ cycle ys
          curlen      = head len
          lxs         = length xs