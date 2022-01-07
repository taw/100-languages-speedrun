ary = [7, 210, "foo", nil]

puts "Type of array:"
puts typeof(ary)

puts ""
puts "Double each element:"
ary.each do |x|
  x ||= "unknown"
  puts "Double of #{x} (#{typeof(x)}) is #{x * 2}"
end
