module Stylegen where

import Data.List (intersperse)
import Data.Map (Map, empty, insertWith, keys, lookup)
import Data.Maybe (fromJust, isJust, isNothing)
import System.Random

type Gendict = Map String [String]

styleGen :: StdGen -> [String] -> Int -> String
styleGen gen words count =
  let dict = buildDict words
      seed = random gen :: (Int, StdGen)
      start = fst $ (random (mkStdGen (fst seed)) :: (Int, StdGen))
      wordgen = snd seed
      first = keys dict !! (start `mod` length dict)
   in concat $ intersperse " " $ take count $ selectWord wordgen first dict

selectWord :: StdGen -> String -> Gendict -> [String]
selectWord gen choice dict
  | isJust (Data.Map.lookup choice dict) =
      let options = fromJust $ Data.Map.lookup choice dict
          rd = random gen
          newWord = options !! ((fst rd) `mod` length options)
       in newWord : selectWord (snd rd) newWord dict
  | isNothing (Data.Map.lookup choice dict) = []

buildDict :: [String] -> Gendict
buildDict (h : t) = foldr addToDict empty $ zip (h : t) t

addToDict :: (String, String) -> Gendict -> Gendict
addToDict (cur, next) dict = insertWith (++) cur [next] dict