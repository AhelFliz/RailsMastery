# frozen_string_literal: true

# Build a method #bubble_sort that takes an array and returns a sorted array. It m
# ust use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).
# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

def bubble_sort(array)
  n = array.length
  (n - 1).times do
    (0...n - 1).each do |i|
      array[i], array[i + 1] = array[i + 1], array[i] if array[i] > array[i + 1]
    end
  end
  array
end

sorted_array = bubble_sort([4, 3, 78, 2, 0, 2])
puts sorted_array.inspect
