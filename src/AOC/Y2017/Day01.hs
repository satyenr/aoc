module AOC.Y2017.Day01 (partOne, partTwo) where

import Data.Char

partOne :: String -> String
partOne = show . (sumDups 1)

partTwo :: String -> String
partTwo input = show $ sumDups ((length input) `div` 2) input

-------------------------------------------------------------------------------
sumDups :: Int -> String -> Int
sumDups nxt xs = sum $ map (digitToInt . fst) $ filter eq $ zip xs (drop nxt $ cycle xs)
    where eq x = fst x == snd x        