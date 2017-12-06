main :: IO ()
main = do
    rawInput <- getContents
    let input = transform rawInput
    print (checksum input)
    print (divsum input)

transform :: String -> [[Int]]
transform input = [map (read::String->Int) x | x <- (map words $ lines input)]

checksum :: [[Int]] -> Int
checksum []     = 0
checksum (x:xs) = (maximum x) - (minimum x) + (checksum xs)

divsum :: [[Int]] -> Int
divsum []     = 0
divsum xss = sum $ map (tDiv . head . (filter tMod)) (map cartProd xss)
    where tMod (a, b) = a `mod` b == 0 || b `mod` a == 0
          tDiv (a, b) = if a > b then a `div` b else b `div` a
          cartProd [] = []
          cartProd (x:xs) = [ (x, a) | a <- xs] ++ (cartProd xs)
