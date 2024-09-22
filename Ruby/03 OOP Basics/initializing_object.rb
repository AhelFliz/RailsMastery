# frozen_string_literal: true

class Person
  def initialize()
    puts 'Initializing Person'
  end
end

person1 = Person.new

# instance variable

class GoodDog
  def initialize(name)
    @name = name
  end
end

nala = GoodDog.new('Nala')

puts nala

# Composition

class Engine
  def start
    puts 'Engine started...'
  end
end

class Car
  def initialize()
    @engine = Engine.new
  end

  def start
    @engine.start
  end
end

bmw = Car.new
bmw.start


