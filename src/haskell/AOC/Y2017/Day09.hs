module AOC.Y2017.Day09 (result) where

result :: String -> (String, String)
result input =
    let countRes = count input Group 0 0 0
        one = show $ fst countRes
        two = show $ snd countRes
    in (one, two)

data State = Group | Garbage deriving Eq

count :: String -> State -> Int -> Int -> Int -> (Int, Int)
count [] _ _ score garbage = (score, garbage)
count (c:cs) state depth score garbage
    | state == Garbage && c == '!' = count (tail cs) state depth score garbage
    | state == Garbage && c == '>' = count cs Group depth score garbage
    | state == Garbage && c /= '>' = count cs state depth score (garbage + 1)
    | state == Group   && c == '{' = count cs Group (depth + 1) score garbage
    | state == Group   && c == '}' = count cs Group (depth - 1) (score + depth) garbage
    | state == Group   && c == '<' = count cs Garbage depth score garbage
    | otherwise                    = count cs state depth score garbage