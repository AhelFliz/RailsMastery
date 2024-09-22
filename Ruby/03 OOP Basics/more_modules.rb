module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
puts buddy.speak('Arf!') # => "Arf!"
kitty.say_name('kitty') # => "kitty"

module Conversions
  def self.farenheit_to_celsius(num)
    (num - 32) * 5 / 9
  end
end

value = Conversions.farenheit_to_celsius(32)
# value = Conversions::farenheit_to_celsius(32)
