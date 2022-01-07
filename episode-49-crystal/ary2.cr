ary = ["foo"] of (String | Nil)
ary << "foo"
ary << nil
puts ary.map{|x| x || "unknown"}
