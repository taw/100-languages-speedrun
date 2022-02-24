{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

class Additive a where
  add :: a -> a -> a

instance Additive String where
  add = (++)

instance Num a => Additive a where
  add = (+)

printAdd :: (Show a, Show b, Additive a, Additive b) => a -> b -> IO ()
printAdd a b =
  putStrLn $ (show a) ++ " + " ++ (show b) ++ " = " ++ (show $ add a b)

main = do
  -- printAdd 400.0 20.0
  -- printAdd 6 0.9
  printAdd "foo" "bar"
