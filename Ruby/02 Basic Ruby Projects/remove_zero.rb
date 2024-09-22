list = [0, 1, 2, 0, 0, 1, 4]

zero_count = list.count(0)

list.delete(0)

list.concat([0] * zero_count)

puts list.inspect

list2 = [0, 1, 2, 0, 0, 1, 4]

list2.each_with_index do |number, index|
  if number == 0
    list2.delete_at(index)  
    list2.push(0)            
  end
end

puts list2.inspect
