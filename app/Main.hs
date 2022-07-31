module Main where

import GHC.IO.FD (openFile)
import GHC.IO.IOMode (IOMode (ReadMode))
import System.Environment (getArgs)
import TextCleaning (cleanText, splitWords)

main :: IO ()
main = do
  fn <- getArgs
  fc <- readFile (head fn)
  print $ splitWords $ cleanText fc