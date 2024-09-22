# frozen_string_literal: true

class GooDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  #  We use the private method call in our program and anything below
  # it is private (unless another method, like protected, is called after it to negate it).

  private #  We use the private method call in our program and anything below it is private (unless another method, like protected, is called after it to negate it).

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years
# NoMethodError: private method `human_years' called for
# <GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>


class Parent
  def say_hi
    p "Hi from Parent."
  end
end

Parent.superclass # => Object

class Child < Parent
  def say_hi
    p "Hi from Child."
  end
end

child = Child.new
child.say_hi # => "Hi from Child."

# It provides a way to invoke a method using a symbol or string
# representing the method name, even if the method is private or protected

son = Child.new
son.send :say_hi
