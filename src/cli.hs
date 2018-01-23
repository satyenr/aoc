{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Monoid
import Formatting
import Formatting.Clock
import Options.Applicative
import System.Clock

import qualified System.Console.Terminal.Size as Terminal
import qualified AOC.Y2017 as Y2017

main :: IO ()
main = do
    clopts <- parseCommandLine
    input <- getContents

    start <- getTime Monotonic
    let result = Y2017.result (day clopts) input
    end <- getTime Monotonic

    fprint ("solutions:\n")
    fprint ("  - part-one: " % string % "\n") (fst result)
    fprint ("  - part-two: " % string % "\n") (snd result)

    fprint ("time: " % timeSpecs % "\n") start end

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
          <> help "Advent of Code year" )
        <*> option auto
           ( long "day"
          <> short 'd'
          <> metavar "DAY"
          <> help "AoC day for the given year" )
        -- <*> option auto
        --    ( long "part"
        --   <> short 'p'
        --   <> metavar "PART"
        --   <> help "Part of the problem" )

parseCommandLine :: IO CommandLine
parseCommandLine = parse $ info (helper <*> commandLineParser)
    (fullDesc <> header "Advent of Code")
    where parse parserInfo =
            Terminal.size >>=
                ($ parserInfo) .
                maybe execParser (customExecParser . prefs . columns . Terminal.width)
