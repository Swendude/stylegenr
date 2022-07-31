module Main where

import GHC.IO.FD (openFile)
import GHC.IO.IOMode (IOMode (ReadMode))
import Stylegen (styleGen)
import System.Environment (getArgs)
import System.Random
import TextCleaning (cleanText, splitWords)

main :: IO ()
main = do
  fn <- getArgs
  fc <- readFile (head fn)
  gen <- getStdGen
  print (styleGen gen (splitWords $ cleanText fc) 400)