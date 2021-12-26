s = "Java is a terrible language"

println(s.split(" ").collect{ w -> w.capitalize() }.join(" "))
println(s.split(" ").collect{ it.capitalize() }.join(" "))
println(s.split(" ")*.capitalize().join(" "))
