import Data.List
import Data.Bool
import Control.Monad

divBy :: Int -> Int -> Bool
divBy = ((0 ==) .) . flip mod

fizz :: Int -> String
fizz = liftM3 bool show (const "Fizz") $ divBy 3

buzz :: Int -> String
buzz = liftM3 bool fizz (const "Buzz") $ divBy 5

fizzbuzz :: Int -> String
fizzbuzz = liftM3 bool buzz (const "FizzBuzz") $ divBy 15

fizzBuzzLoop :: Int -> String
fizzBuzzLoop =
  intercalate "\n" . map fizzbuzz . flip take [1..]

main =
  putStrLn $ fizzBuzzLoop 100
