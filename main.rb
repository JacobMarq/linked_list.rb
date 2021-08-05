require_relative "linked_list.rb"

list = LinkedList.new

list.append(5)
list.append(6)
list.append(7)
list.append(8)
list.append(9)
list.append(2)
puts "append: #{list.to_s}"
list.prepend(3)
puts "prepend: #{list.to_s}"
list.pop
puts "pop: #{list.to_s}"
list.remove_at(3)
puts "remove at: #{list.to_s}"
list.insert_at(7, 3)
puts "insert at: #{list.to_s}"

puts "size: #{list.size}"
puts "head: #{list.head}, value: #{list.head.value}"
puts "tail: #{list.tail}, value: #{list.tail.value}"
puts "at 3: #{list.at(3)}, value: #{list.at(3).value}"
puts "contains 1?: #{list.contains?(1)}"
puts "contains 3?: #{list.contains?(3)}"
puts "find 8: #{list.find(8)}"
list.reverse!
puts "reverse!: #{list.to_s}"
list.each { |i| puts i.value }
puts "reverse: #{list.reverse}"
