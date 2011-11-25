#Find out how to access files with and without code blocks. What is the benefit of the code block?
File.open('foo', 'w') { |file| file.puts 'write line with code block'}

file = File.new('foo', 'w')
file.puts 'write line without code block'
file.close

puts '---- read without code block ----'
file = File.new('bar', 'r')
puts file.readlines
file.close


puts '---- recursive code block ----'
File.open('bar', 'r') do |file|
  file.each_line { |line| puts line }
end

puts '---- With IO ----'
IO.foreach('bar') { |line| puts line }


#How would you translate a hash to an array? Can you translate arrays to hashes?
puts '---- hash to array ----'
hash = {:foo => "str", :bar => 42 }
puts hash.to_a.inspect

array = ['foo', 'bar']
puts '---- array to hash v1 ----'
hash  = {}
array.each_index { |position| hash[position] = array[position]}
puts hash.to_a.inspect

puts '---- array to hash v2 ----'
hash  = {}
array.each_with_index { |value, key | hash[key] = value}
puts hash.to_a.inspect

#Can you iterate through a hash?
puts '---- iteration ----'
hash = {:foo => "str", :bar => 42 }
hash.each { |key, value| puts key, value}

#You can use Ruby arrays as stacks. What other common data structures do arrays support?




