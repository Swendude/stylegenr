module Stylegen where

import Data.Map (Map, empty, insertWith)

type Gendict = Map String [String]

styleGen :: [String] -> Int -> String
styleGen words count = concat $ take count $ repeat $ head words

buildDict :: [String] -> Gendict
buildDict (h : t) = foldr addToDict empty $ zip (h : t) t

addToDict :: (String, String) -> Gendict -> Gendict
addToDict (cur, next) dict = insertWith (++) cur [next] dict