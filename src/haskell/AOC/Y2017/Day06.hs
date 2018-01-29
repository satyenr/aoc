module AOC.Y2017.Day06 (result) where

import Data.Maybe (fromJust)
import Data.List  (elemIndex)
import Data.Set   (Set)
import AOC.Utils  (rotate)

import qualified Data.Set as S

result :: String -> (String, String)
result input =
    let banks = map (read :: String -> Int) $ words input
        redistRes = redistCount banks S.empty 0
        one = show $ fst redistRes
        two = show $ fst $ redistCount (snd redistRes) S.empty 0
    in (one, two)

redistCount :: [Int] -> Set [Int] -> Int -> (Int, [Int])
redistCount banks seen acc
    | S.member banks seen = (acc, banks)
    | otherwise           = redistCount banks' seen' (acc + 1)
    where banks' = redist banks
          seen'  = S.insert banks seen

redist :: [Int] -> [Int]
redist banks = 
    let maxIndex          = fromJust $ elemIndex maxBlocks banks
        maxBlocks         = maximum banks
        len               = length banks
        blocks            = maxBlocks `div` len
        (extras, normals) = splitAt (maxBlocks `mod` len) $ init (rotate (maxIndex + 1) banks) ++ [0]
    in rotate (len - maxIndex - 1) $ map (+ (blocks + 1)) extras ++ map (+ blocks) normals