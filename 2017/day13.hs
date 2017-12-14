import qualified Data.Map as M

main :: IO ()
main = do
--     input <- getContents
    let scnData = M.fromList [(0, 3), (1, 2), (4, 4), (6, 4)]
    print (totalPenalty scnData)

scannerPosition :: Int -> Int -> Int
scannerPosition psec range
    | 0 <- range        = -1
    | odd quotient  = limit - (psec `mod` limit)
    | even quotient = psec `mod` limit
    where quotient = psec `div` limit
          limit    = range - 1

totalPenalty :: M.Map Int Int -> [Int]
totalPenalty scnData = take 10 [ penalty (depth psec) | psec <- [0 .. 10], scannerPosition psec (range $ depth psec) == depth psec]
    where depth ps    = ps
          range dep   = M.findWithDefault 0 dep scnData
          penalty dep = dep * (range dep)

