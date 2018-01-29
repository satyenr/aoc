module AOC.Y2017.Day02 (result) where

result :: String -> (String, String)
result input =
    let spreadsheet = transform input
        one = show $ checksum spreadsheet
        two = show $ divsum spreadsheet
    in (one, two)

transform :: String -> [[Int]]
transform input = [map (read :: String -> Int) x | x <- (map words $ lines input)]

checksum :: [[Int]] -> Int
checksum []     = 0
checksum (x:xs) = (maximum x) - (minimum x) + (checksum xs)

divsum :: [[Int]] -> Int
divsum []     = 0
divsum xss = sum $ map (quotient . head . (filter divisible) . cartProd) xss
    where divisible (a, b) = a `mod` b == 0 || b `mod` a == 0
          quotient  (a, b) = if a > b then a `div` b else b `div` a
          cartProd  []     = []
          cartProd  (x:xs) = [(x, a) | a <- xs] ++ (cartProd xs)

