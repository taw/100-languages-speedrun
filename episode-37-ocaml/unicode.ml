type printable =
    S of string
  | I of int
;;

let printable_to_string = function
    S s -> s
  | I i -> string_of_int i
;;

let rec string_join sep = function
    [] -> ""
  | [s] -> s
  | (s::ss) -> s ^ sep ^ (string_join sep ss)
;;

let console_log list =
  print_string ((string_join " " (List.map printable_to_string list)) ^ "\n")
;;

console_log [(S "Length of [1; 2; 3] is "); (I (List.length [1; 2; 3]))];;
console_log [(S "Length of \"Hello\" is"); (I (String.length "Hello"))];;
console_log [(S "Length of \"Żółw\" is"); (I (String.length "Żółw"))];;
console_log [(S "Length of \"💩\" is"); (I (String.length "💩"))];;
