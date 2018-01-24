module AOC.Y2017 (result) where

import qualified AOC.Y2017.Day01 as D01
import qualified AOC.Y2017.Day02 as D02
import qualified AOC.Y2017.Day04 as D04
import qualified AOC.Y2017.Day05 as D05
import qualified AOC.Y2017.Day06 as D06
import qualified AOC.Y2017.Day09 as D09
import qualified AOC.Y2017.Day10 as D10

result :: Int -> String -> (String, String)
result 1  = D01.result
result 2  = D02.result
result 4  = D04.result
result 5  = D05.result
result 6  = D06.result
result 9  = D09.result
result 10 = D10.result
result _  = error "Day not available"
