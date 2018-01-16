import Control.Applicative  (liftA2)
import Data.Bits            (xor)
import Data.Char            (ord)
import Data.List.Split      (splitOn, chunksOf)
import Data.String.Utils    (strip)
import Numeric              (showHex)


main :: IO ()
main = do
    input <- getContents
    let list = [0 .. 255]

    -- Part 1
    let lengths = map (read :: String -> Int) $ splitOn "," input
    print (product $ take 2 $ knotHash lengths list 0 0)

    -- Part 2
    let salt = [17, 31, 73, 47, 23]
    let bytes = map ord (strip input) ++ salt
    let shRuns = 64
    let sh = sparseHash bytes list shRuns
    let dhChunkSz = 16
    let dh = denseHash sh dhChunkSz
    putStrLn (concat $ map hex dh)

knotHash :: [Int] -> [Int] -> Int -> Int -> [Int]
knotHash [] list _ _          = list
knotHash (x:xs) list cur skip = knotHash xs list' cur' (skip + 1)
    where list'       = rotate (length list - cur) $ nxt $ rotate cur list
          nxt         = liftA2 (++) (reverse . (take x)) (drop x)
          cur'        = (cur + x + skip) `mod` (length list)
          rotate n ys = take (length ys) $ drop n $ cycle ys

sparseHash :: [Int] -> [Int] -> Int -> [Int]
sparseHash xs list count =
    let bytes = take (count * (length xs)) $ cycle xs
    in knotHash bytes list 0 0

denseHash :: [Int] -> Int -> [Int]
denseHash xs chunkSz = map (foldl xor 0) $ chunksOf chunkSz xs

hex :: Int -> String
hex num =
    let x = showHex num ""
    in if length x == 1 then "0" ++ x else x