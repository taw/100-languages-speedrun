data Vec t = Vec t t

instance (Show t) => Show (Vec t) where
  show (Vec a b) = "<" ++ show a ++ "," ++ show b ++ ">"

instance (Num t) => Num (Vec t) where
  (+) (Vec ax ay) (Vec bx by) = Vec (ax + ay) (by + by)
  (-) (Vec ax ay) (Vec bx by) = Vec (ax - ay) (by - by)
  (*) (Vec ax ay) (Vec bx by) = Vec (ax * ay) (by * by)
  abs (Vec ax ay) = Vec (abs ax) (abs ay)
  signum (Vec ax ay) = Vec (signum ax) (signum ay)
  fromInteger n = Vec (fromInteger n) (fromInteger n)

add :: (Show t, Num t) => t -> t -> String
add x y = (show x) ++ " + " ++ (show y) ++ " = " ++ (show (x + y))

main = do
  putStrLn (add (Vec 20 30) (Vec 40 50))
  putStrLn (add (Vec 55.5 14.5) (Vec 210 210))
  putStrLn (show (Vec "foo" "bar"))
