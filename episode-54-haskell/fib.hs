fib :: Int -> Int
fib 1 = 1
fib 2 = 1
fib n = fib (n-1) + fib (n-2)

fibStr :: Int -> String
fibStr n = "fib(" ++ (show n) ++ ")=" ++ show (fib n) ++ "\n"

fibLoop :: Int -> String
fibLoop 0 = ""
fibLoop n = fibLoop (n-1) ++ fibStr n

main = do
  putStr (fibLoop 20)
