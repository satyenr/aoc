module AOC.Y2017.Day10 (result) where

import Control.Applicative  (liftA2)
import Data.Bits            (xor)
import Data.Char            (ord)
import Data.List.Split      (splitOn, chunksOf)
import Data.String.Utils    (strip)
import Numeric              (showHex)
import AOC.Utils            (rotate)

result :: String -> (String, String)
result input =
    let list = [0 .. 255]
        lengths = map (read :: String -> Int) $ splitOn "," input
        salt = [17, 31, 73, 47, 23]
        bytes = map ord (strip input) ++ salt
        shRuns = 64
        sh = sparseHash bytes list shRuns
        dhChunkSz = 16
        dh = denseHash sh dhChunkSz    
        one = show $ product $ take 2 $ knotHash lengths list 0 0
        two = show $ concat $ map hex dh
    in (one, two)

knotHash :: [Int] -> [Int] -> Int -> Int -> [Int]
knotHash [] list _ _          = list
knotHash (x:xs) list cur skip = knotHash xs list' cur' (skip + 1)
    where list'       = rotate (length list - cur) $ nxt $ rotate cur list
          nxt         = liftA2 (++) (reverse . (take x)) (drop x)
          cur'        = (cur + x + skip) `mod` (length list)

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