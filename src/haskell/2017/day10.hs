import Control.Applicative
import Data.Char
import Data.List.Split


main :: IO ()
main = do
    input <- getContents
    let list = [0 .. 255]

    -- Part One
    let lengths = map (read :: String -> Int) $ splitOn "," input
    print (product $ take 2 $ knotHash lengths list 0 0)

knotHash :: [Int] -> [Int] -> Int -> Int -> [Int]
knotHash [] list _ _          = list
knotHash (x:xs) list cur skip = knotHash xs list' cur' (skip + 1)
    where list'       = rotate (length list - cur) $ nxt $ rotate cur list
          nxt         = liftA2 (++) (reverse . (take x)) (drop x)
          cur'        = (cur + x + skip) `mod` (length list)
          rotate n ys = take (length ys) $ drop n $ cycle ys