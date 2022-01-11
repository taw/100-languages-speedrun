import Data.List

-- FizzBuzz in Haskell
fizzbuzz :: Int -> String
fizzbuzz n
  | n `mod` 15 == 0 = "FizzBuzz"
  | n `mod` 5 == 0 = "Buzz"
  | n `mod` 3 == 0 = "Fizz"
  | otherwise = show n

fizzBuzzLoop :: Int -> String
fizzBuzzLoop n =
  intercalate "\n" (map fizzbuzz [1..n])

main =
  putStrLn (fizzBuzzLoop 100)
