module Main where

import Lib (cleanText, removePunct, replaceWhitespace, splitWords, strip)
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Test if splitWords works" $ do
    it "splitWords should split a string into words" $ do
      splitWords "thanks for all the fish" `shouldBe` ["thanks", "for", "all", "the", "fish"]
    it "splitWords should split a string into words ignoring multiple spaces" $ do
      splitWords " thanks  for   all    the fish" `shouldBe` ["thanks", "for", "all", "the", "fish"]
  describe "Test if replaceWhitespace works" $ do
    it "replaceWhitespace replaces all whitespace" $ do
      replaceWhitespace "\nthanks\t \tfor\n all\n the fish" `shouldBe` " thanks   for  all  the fish"
    it "replaceWhitespace replaces all whitespace even in the case of doubles" $ do
      replaceWhitespace "\nthanks\t \tfor\n\n all\n the fish" `shouldBe` " thanks   for   all  the fish"
    it "replaceWhitespace replaces all whitespace even in the case of punctuation" $ do
      replaceWhitespace "\nthanks\t \tfor\n:\n \nall\n the fish" `shouldBe` " thanks   for :   all  the fish"
  describe "Test if removePunct works" $ do
    it "removePunct replaces all punctuation" $ do
      removePunct "thanks! for. all: the fish" `shouldBe` "thanks for all the fish"
  describe "Test if strip works" $ do
    it "Strip strips all whitespace in front and back" $ do
      strip " We are monkeys " `shouldBe` "We are monkeys"
    it "Strip strips all double whitespace" $ do
      strip "We  are monkeys" `shouldBe` "We are monkeys"
    it "Strip strips all triple whitespace" $ do
      strip "We   are  monkeys" `shouldBe` "We are monkeys"
    it "Strip strips all double whitespace and strips in front and back" $ do
      strip " We  are  monkeys " `shouldBe` "We are monkeys"
  describe "Test if cleanText works" $ do
    it "cleanText removes all whitespace and makes the text lowercase" $ do
      cleanText "\nThanks\t \tFOR\n all\n the fISh" `shouldBe` " thanks   for  all  the fish"
    it "cleanText works on the test file" $ do
      fc <- readFile "./corpus/test.txt"
      cleanText fc `shouldBe` "roses are red the grass is green"
