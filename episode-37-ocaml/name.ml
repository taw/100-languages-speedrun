let ask_for_name () = (
  print_string "What's your name? ";
  read_line()
);;

print_string ("Hello, "^ask_for_name()^"!\n");;
