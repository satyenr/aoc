main :: IO ()
main = do
    input <- getContents
    let result = count input Group 0 0 0

    -- Part 1
    print (fst result)

    -- Part 2
    print (snd result)

data State = Group | Garbage deriving Eq

count :: String -> State -> Int -> Int -> Int -> (Int, Int)
count [] _ _ score garbage         = (score, garbage)
count (c:cs) state depth score garbage
    | state == Garbage && c == '!' = count (tail cs) state depth score garbage
    | state == Garbage && c == '>' = count cs Group depth score garbage
    | state == Garbage && c /= '>' = count cs state depth score (garbage + 1)
    | state == Group   && c == '{' = count cs Group (depth + 1) score garbage
    | state == Group   && c == '}' = count cs Group (depth - 1) (score + depth) garbage
    | state == Group   && c == '<' = count cs Garbage depth score garbage
    | otherwise                    = count cs state depth score garbage