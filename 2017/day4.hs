import qualified Data.Set as Set

main :: IO ()
main = do
    input <- getContents
    print (allUnique input)

allUnique :: String -> Int
allUnique input = length $ filter isValid (lines input)
    where isValid pp    = uniq pp == wc pp
          uniq    str   = Set.size $ Set.fromList (words str)
          wc      str   = length (words str)