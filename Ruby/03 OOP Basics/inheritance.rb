# frozen_string_literal: true

# Inheritance is when a class inherits behavior from another class

class Animal
  def speak
    'Hello!'
  end
end

class Dog < Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says WOF!"
  end
end

class Cat < Animal
end

sparky = Dog.new('Ares')
paws = Cat.new

puts sparky.speak
puts paws.speak

# SUPER
# Ruby provides us with the super keyword to call methods earlier in the method lookup path

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

def initialize(age, name)
  super(name)
  @age = age
end

sparky = GoodDog.new('brown')
sparky.speak # => "Hello! from GoodDog class"

# super(a, b), the specified arguments will be sent up the method lookup chain
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, 'bear') # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
