import Data.List.Split (splitOn)
import Control.Applicative

main :: IO ()
main = do
    input <- getContents
    let lengths = map (read :: String -> Int) $ splitOn "," input
    print (product $ take 2 $ partOne [0 .. 255] lengths 0 0)

partOne :: [Int] -> [Int] -> Int -> Int -> [Int]
partOne xs [] _ _ = xs
partOne xs len cur skip = partOne xs' len' cur' skip'
    where xs'         = rotate (length xs - cur) $ nxt $ rotate cur xs
          nxt         = liftA2 (++) (reverse . (take curlen)) (drop curlen)
          len'        = tail len
          cur'        = (cur + curlen + skip) `mod` (length xs)
          skip'       = skip + 1
          rotate n ys = take (length ys) $ drop n $ cycle ys
          curlen      = head len