{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Monoid
import Formatting
import Formatting.Clock
import Options.Applicative
import System.Clock

import qualified System.Console.Terminal.Size as Terminal
import qualified AOC.Y2017                    as Y2017

main :: IO ()
main = do
    clopts <- parseCommandLine

    start <- getTime Monotonic
    input <- getContents
    ready <- getTime Monotonic
    let res = result (year clopts) (day clopts) input
    end <- getTime Monotonic

    fprint ("answer:\n")
    fprint ("  part-one: " % string % "\n") (fst res)
    fprint ("  part-two: " % string % "\n") (snd res)

    fprint ("time:\n")
    fprint ("  input: " % timeSpecs % "\n") start ready
    fprint ("  process: " % timeSpecs % "\n") ready end
    fprint ("  total: " % timeSpecs % "\n") start end

result :: Int -> (Int -> String -> (String, String))
result 2017 = Y2017.result
result _    = error "Year not available"

-- CLI Parsing ----------------------------------------------------------------

data CommandLine = CommandLine { year  :: Int
                               , day   :: Int
                               } deriving (Show)

commandLineParser :: Parser CommandLine
commandLineParser = CommandLine
        <$> option auto
           ( long "year"
          <> short 'y'
          <> metavar "YEAR"
          <> showDefault
          <> value 2017
          <> help "advent of code year" )
        <*> option auto
           ( long "day"
          <> short 'd'
          <> metavar "DAY"
          <> help "advent of code day for the given year" )

parseCommandLine :: IO CommandLine
parseCommandLine = parse $ info (helper <*> commandLineParser)
    (fullDesc <> header "Advent of Code (Haskell)")
    where parse parserInfo =
            Terminal.size >>=
                ($ parserInfo) .
                maybe execParser (customExecParser . prefs . columns . Terminal.width)
