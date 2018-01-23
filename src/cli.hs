module Main where

import Data.Monoid
import Options.Applicative
import System.Clock

import qualified System.Console.Terminal.Size as Terminal
import qualified AOC.Y2017.Day01

data CommandLine = CommandLine { year  :: Int
                               , day   :: Int
                               , part  :: Int
                               } deriving (Show)

commandLineParser :: Parser CommandLine
commandLineParser = CommandLine
        <$> option auto
           ( long "year"
          <> short 'y'
          <> metavar "YEAR"
          <> help "Advent of Code year" )
        <*> option auto
           ( long "day"
          <> short 'd'
          <> metavar "DAY"
          <> help "AoC day for the given year" )
        <*> option auto
           ( long "part"
          <> short 'p'
          <> metavar "PART"
          <> help "Part of the problem" )

parseCommandLine :: IO CommandLine
parseCommandLine = parse $ info (helper <*> commandLineParser)
    (fullDesc <> header "Advent of Code")   
    where parse parserInfo =
            Terminal.size >>=
                ($ parserInfo) .
                maybe execParser (customExecParser . prefs . columns . Terminal.width)

main :: IO ()
main = do
    cli <- parseCommandLine
    input <- getContents

    t0 <- getTime Monotonic
    print (AOC.Y2017.Day01.partOne input)
    t1 <- getTime Monotonic
    print (AOC.Y2017.Day01.partTwo input)
    t2 <- getTime Monotonic
    print (t2 - t1, t1 - t0, t2 - t0)