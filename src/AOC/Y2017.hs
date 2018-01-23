module AOC.Y2017 (result) where

import qualified AOC.Y2017.Day01 as D01

result :: Int -> String -> (String, String)
result 1 = D01.result
result _ = error "Not available"
