module Main where

import GHC.IO.FD (openFile)
import GHC.IO.IOMode (IOMode (ReadMode))
import Lib (cleanText)
import System.Environment (getArgs)

main :: IO ()
main = do
  fn <- getArgs
  fc <- readFile (head fn)
  print $ cleanText fc