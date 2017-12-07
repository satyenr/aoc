import qualified Data.Set as Set

main :: IO ()
main = do
    input <- getContents
    print (validCount input)

isValid :: String -> Bool
isValid pp = uniqueWords pp == allWords pp
    where uniqueWords str = Set.size $ Set.fromList (words str)
          allWords str    = length (words str)

validCount :: String -> Int
validCount input = length $ filter isValid (lines input)