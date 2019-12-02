module Main where

import qualified Data.List as List
    
main :: IO ()
main = do
    input <- getContents
    print $ totalFuelRequired (getMasses input)

-- | https://adventofcode.com/2019/day/1
getMasses :: String -> [Int]
getMasses = map (read :: String -> Int) . lines

totalFuelRequired :: [Int] -> Int
totalFuelRequired masses = List.foldl' (+) 0 $ map fuelRequired masses
    where fuelRequired m = (div m 3) - 2