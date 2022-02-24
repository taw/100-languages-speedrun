instance Num [a] where
  (+) = (++)
  (*) = error "not implemented"
  abs = error "not implemented"
  signum = error "not implemented"
  fromInteger = error "not implemented"
  negate = error "not implemented"

add :: (Show t, Num t) => t -> t -> String
add x y = (show x) ++ " + " ++ (show y) ++ " = " ++ (show (x + y))

main = do
  putStrLn (add 40 380)
  putStrLn (add 6 0.9)
  putStrLn (add "foo" "bar")
  putStrLn (add "foo" 7)
