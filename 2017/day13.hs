import           Data.Map (Map)
import qualified Data.Map as M

main :: IO ()
main = do
     input <- getContents
--    let scnData = M.fromList [(0, 3), (1, 2), (4, 4), (6, 4)]
    print (totalPenalty scnData)

transform :: String -> Map Int Int
transform input = [map (read::String->Int) x | x <- (map words $ lines input)]

scnPos :: Int -> Int -> Int
scnPos psec range
    | 0 <- range    = -1
    | 1 <- range    = 0
    | odd  quotient = limit - (psec `mod` limit)
    | even quotient = psec `mod` limit
    where quotient = psec `div` limit
          limit    = range - 1


totalPenalty :: Map Int Int -> Int
totalPenalty scnData = sum [penalty (pktPos psec) | psec <- [0..up], ((scnPos psec (range $ pktPos psec)) == 0)]
    where pktPos ps   = ps
          range dep   = M.findWithDefault 0 dep scnData
          penalty dep = dep * (range dep)
          up          = maximum $ M.keys scnData
