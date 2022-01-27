Point = Origin mimic
Point asText = method("<#{x},#{y}>")
Point + = method(other,
  result = Point mimic
  result x = self x + other x
  result y = self y + other y
  result)
