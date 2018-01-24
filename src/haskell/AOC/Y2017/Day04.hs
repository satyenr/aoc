module AOC.Y2017.Day04 (result) where

import Data.List

result :: String -> (String, String)
result input =
    let one = show $ allunique input
        two = show $ noanagrams input
    in (one, two)

unique :: [String] -> Bool
unique xs = length (nub xs) == length xs

allunique :: String -> Int
allunique pass = length $ filter (unique . words) (lines pass)

noanagrams :: String -> Int
noanagrams pass = length $ filter (unique . (map sort) . words) (lines pass)
