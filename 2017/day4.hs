import qualified Data.Set as Set
import Data.List

main :: IO ()
main = do
    input <- getContents
    print (allunique  input)
    print (noanagrams input)

unique :: [String] -> Bool
unique xs = uniq xs == length xs
    where uniq = Set.size . Set.fromList

allunique :: String -> Int
allunique pass = length $ filter (unique . words) (lines pass)

noanagrams :: String -> Int
noanagrams pass = length $ filter (unique . (map sort) . words) (lines pass)
