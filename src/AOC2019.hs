module Main where

import qualified Data.List                     as List
import           Text.Printf                    ( printf )

main :: IO ()
main = do
    input <- getContents

    -- Day 01
    let masses = getMasses input
    printf "The Tyranny of the Rocket Equation \t %d \t %d"
           (totalFuelRequired masses)
           (totalFuelRequired' masses)

-- | https://adventofcode.com/2019/day/1
getMasses :: String -> [Int]
getMasses = map (read :: String -> Int) . lines

totalFuelRequired :: [Int] -> Int
totalFuelRequired masses = List.foldl' (+) 0 $ map fuelRequired masses

totalFuelRequired' :: [Int] -> Int
totalFuelRequired' masses = List.foldl' (+) 0 $ map fuelRequired' masses

fuelRequired' :: Int -> Int
fuelRequired' m = sum $ takeWhile (> 0) $ drop 1 $ iterate fuelRequired m

fuelRequired :: Int -> Int
fuelRequired m = max ((div m 3) - 2) 0
