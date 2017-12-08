import Data.List

main :: IO ()
main = do
    input <- getContents
    print (allunique  input)
    print (noanagrams input)

unique :: [String] -> Bool
unique xs = length (nub xs) == length xs

allunique :: String -> Int
allunique pass = length $ filter (unique . words) (lines pass)

noanagrams :: String -> Int
noanagrams pass = length $ filter (unique . (map sort) . words) (lines pass)
