import Data.List.Split (splitOn)

main :: IO ()
main = do
    input <- getContents
    let lengths = map (read::String->Int) $ splitOn "," input
    print (product $ take 2 $ twist [0 .. 255] lengths 0 0)

twist :: [Int] -> [Int] -> Int -> Int -> [Int]
twist xs [] _ _ = xs
twist xs len cur skip = twist (take (length xs) $ (reverse $ take (head len) $ drop cur $ cycle xs) ++ (drop ((head len) + cur) $ cycle xs)) (tail len) (cur + (head len) + skip) (skip + 1)
