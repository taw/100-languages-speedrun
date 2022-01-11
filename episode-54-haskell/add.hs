add :: (Show t, Num t) => t -> t -> String
add x y = (show x) ++ " + " ++ (show y) ++ " = " ++ (show (x + y))

main = do
  putStrLn (add 40 380)
  putStrLn (add 6 0.9)
