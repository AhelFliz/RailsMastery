# frozen_string_literal: true

class Person
  @@number_persons = 0 # They belong to a specific object and are unique to each instance of the class. (Class variable)
  AGE = 3 # Constants

  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age * AGE
    @@number_persons += 1
  end

  def self.total_of_persons
    @@number_persons
  end

  def self.who_am_i
    "I'm a person!"
  end

  # the to_s method returns the name of the object's class and an encoding of the object id.
  def to_s
    "I'm a #{@name} and I'm #{@age} years old"
  end
end

# Without creating a new object
puts Person.who_am_i
puts Person.total_of_persons

person = Person.new('Jim', 20)
person2 = Person.new('Jom', 10)

puts Person.total_of_persons

puts person.age
puts person2.age

puts person

class Foo
  def to_s
    '42'
  end
end

foo = Foo.new
puts foo             # Prints 42
puts "foo is #{foo}" # Prints: foo is 42
