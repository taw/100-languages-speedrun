ary = [1, 2, 3, nil]

puts "Type of array:"
puts typeof(ary)

puts ""
puts "Type of each element:"
ary.each do |x|
  puts typeof(x)
end

puts ""
puts "Type of each element:"
ary.each do |x|
  if x
    puts typeof(x)
  else
    puts typeof(x)
  end
end
