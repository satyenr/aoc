import Data.List.Split (splitOn)

main :: IO ()
main = do
    input <- getContents
    let lengths = map (read::String->Int) $ splitOn "," input
    print (product $ take 2 $ twist [0 .. 255] lengths 0 0)

twist :: [Int] -> [Int] -> Int -> Int -> [Int]
twist xs [] _ _ = xs
twist xs len cur skip = twist xs' len' cur' (skip + 1)
    where xs'    = take (length xs) $ (reverse $ take curlen $ drop cur $ cycle xs) ++ (drop (curlen + cur) $ cycle xs)
          len'   = tail len
          curlen = head len
          cur'   = cur + skip + curlen