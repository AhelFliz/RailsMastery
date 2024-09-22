# frozen_string_literal: true

module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal2; end

class Fish < Animal2
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal2
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end

sparky = Dog.new
neemo = Fish.new
paws = Cat.new

puts sparky.swim # => I'm swimming!
puts neemo.swim # => I'm swimming!
paws.swim # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>