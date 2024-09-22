# The include? method

numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number|
  if number == element
    result = true
    break
  end
end

result
# => true

element = 3
result = false

numbers.each do |number|
  if number == element
    result = true
    break
  end
end

result
#=> false


# Using #include?, this code can be greatly simplified:

numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false


friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian')
#=> false


# The any? method

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number > 500
    result = true
    break
  end
end

result
#=> true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number < 20
    result = true
    break
  end
end

result
#=> false

# Using #any?, this code can be greatly simplified:

numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| number > 500 }
#=> true

numbers.any? { |number| number < 20 }
#=> false


# The all? method

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 3
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end
end

result = fruits.length == matches.length
result
#=> false


# Using #all?, this code can be greatly simplified:

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false


# The none? method

fruits = ["apple", "banana", "strawberry", "pineapple"]
result = false

fruits.each do |fruit|
  if fruit.length > 10
    result = false
    break
  end

  result = true
end

result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
result = false

fruits.each do |fruit|
  if fruit.length > 6
    result = false
    break
  end

  result = true
end

result
#=> false


# Using #none?, this can be greatly simplified:

fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> false
