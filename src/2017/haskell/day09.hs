main :: IO ()
main = do
    input <- getContents
    print (score input Group 0 0)

data State = Group | Garbage deriving Eq

score :: String -> State -> Int -> Int -> Int
score [] _ _ acc          = acc
score (c:cs) state depth acc
    | c == '!'                     = score (tail cs) state depth acc
    | state == Garbage && c == '>' = score cs Group depth acc
    | state == Group   && c == '{' = score cs Group (depth + 1) acc
    | state == Group   && c == '}' = score cs Group (depth - 1) (acc + depth)
    | state == Group   && c == '<' = score cs Garbage depth acc
    | otherwise                    = score cs state depth acc