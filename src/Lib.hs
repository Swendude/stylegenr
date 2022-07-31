module Lib where

import Data.Text qualified as T
import Text.Printf qualified as String

splitWords :: String -> [String]
splitWords s = splitWords' s ""

splitWords' :: String -> String -> [String]
splitWords' (h : inp_t) stack
  | h == ' ' && stack /= "" = stack : splitWords' inp_t ""
  | h == ' ' && stack == "" = splitWords' inp_t ""
  | otherwise = splitWords' inp_t (stack ++ [h])
splitWords' [] stack = [stack]

replaceWhitespace :: String -> String
replaceWhitespace s =
  T.unpack $
    T.replace "\t" " " $
      T.replace "\n" " " $
        T.pack s

notPunct :: Char -> Bool
notPunct s = notElem s (",.?!-:;\"\'" :: String)

removePunct :: String -> String
removePunct s = filter notPunct s

strip :: String -> String
strip s = strip' s ' '

strip' :: String -> Char -> String
strip' [x] prev
  | x == ' ' = ""
  | otherwise = [x]
strip' (x : xs) prev
  | x == ' ' && prev == ' ' = strip' xs x
  | otherwise = x : strip' xs x

cleanText :: String -> String
cleanText s = replaceWhitespace $ T.unpack $ T.toLower $ T.pack $ removePunct s
