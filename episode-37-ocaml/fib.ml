let rec fib n =
  if n <= 2
    then 1
    else fib (n - 1) + fib (n - 2)
;;

for i = 1 to 20 do
  print_string("fib(" ^ (string_of_int(i)) ^ ")=" ^ (string_of_int(fib(i))) ^ "\n")
done;;
