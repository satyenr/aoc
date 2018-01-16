import Data.Char

main :: IO ()
main = do
    input <- getLine

    -- Part 1
    print (sumOfRepeated input 1)

    -- Part 2
    print (sumOfRepeated input ((length input) `div` 2))

sumOfRepeated :: String -> Int -> Int
sumOfRepeated xs n = sum $ map (digitToInt . fst) $ filter eq $ zip xs (drop n $ cycle xs)
        where eq x = fst x == snd x


