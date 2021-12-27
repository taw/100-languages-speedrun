type point = {x: float; y: float};;

let (+&) a b = {x=a.x +. b.x; y = a.y +. b.y};;

let a = {x=1.0; y=2.0};;
let b = {x=2.0; y=5.0};;
let c = a +& b;;

Printf.printf "<%f,%f>\n" c.x c.y;;
