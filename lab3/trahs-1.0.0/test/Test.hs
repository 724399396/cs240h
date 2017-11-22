module Main where

import           Test.Hspec
import           Test.QuickCheck

import           Trahs

main :: IO ()
main = hspec $ describe "Testing Lab 3" $ do
  -- example quickcheck test in hspec.
  describe "read" $ do
    it "is inverse to show" $ property $
      \x -> (read . show) x == (x :: Int)

  describe "generateReplicaId" $ do
    it "should range in 64 bit int" $ do
      x <- generateReplicaId
      x `shouldSatisfy` (\y -> y >= minBound && y <= maxBound)
