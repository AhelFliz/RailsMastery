# frozen_string_literal: true

# Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some
# instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0
# during instantiation of the object to track the current speed of the car as well. Create instance methods that allow
# the car to speed up, brake, and shut the car off.

# Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that
# allows you to view, but not modify, the year of your car.


class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(speed)
    self.speed += speed
  end

  def brake_down(curb)
    self.speed -= curb
  end

  def shut_off
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def spray_paint=
    # code here
  end
end

m3 = MyCar.new(2018, 'black', 'F80')

m3.speed_up(120)
puts m3.speed

m3.brake_down(30)
puts m3.speed

m3.shut_off
puts m3.speed

puts m3.color
m3.color = 'red'
puts m3.color

puts m3.year

m3.spray_paint('green')
