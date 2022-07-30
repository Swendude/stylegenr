module Lib where

splitWords :: String -> [String]
splitWords s = splitWords' s ""

splitWords' :: String -> String -> [String]
splitWords' (h : inp_t) stack
  | h == ' ' && stack /= "" = stack : splitWords' inp_t ""
  | h == ' ' && stack == "" = splitWords' inp_t ""
  | otherwise = splitWords' inp_t (stack ++ [h])
splitWords' [] stack = [stack]
