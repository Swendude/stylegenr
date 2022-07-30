module Main where

import Lib (splitWords)
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Test if splitWords works" $ do
    it "splitWords should split a string into words" $ do
      splitWords "thanks for all the fish" `shouldBe` ["thanks", "for", "all", "the", "fish"]
    it "splitWords should split a string into words ignoring multiple spaces" $ do
      splitWords " thanks  for   all    the fish" `shouldBe` ["thanks", "for", "all", "the", "fish"]
  -- describe "Test if replaceWhitespace works" $ do
  --   it "replaceWhitespace replaces all whitespace" $ do
  --     replaceWhitespace "/nthanks/t /tfor /n all/n the fish" `shouldBe` "thanks for all the fish"
