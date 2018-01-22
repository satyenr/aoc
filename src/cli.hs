module Main where

import           Data.Monoid ((<>))
import           Options.Applicative
import qualified System.Console.Terminal.Size as Terminal

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
    print (cli)
    
