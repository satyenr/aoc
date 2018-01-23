{-# LANGUAGE OverloadedStrings #-}

module AOC.Y2017.Day01 (result) where

import Data.Char
import Data.Text (strip, unpack, pack)

result :: String -> (String, String)
result input =
    let saneInput = (unpack . strip . pack) input
        one = show $ sumDups 1 saneInput
        two = show $ sumDups ((length saneInput) `div` 2) saneInput
    in (one, two)

sumDups :: Int -> String -> Int
sumDups n xs = sum $ map (digitToInt . fst) $ filter eq $ zip xs (drop n $ cycle xs)
    where eq x = fst x == snd x
