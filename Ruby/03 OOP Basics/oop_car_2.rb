# frozen_string_literal: true

# Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.
# Override the to_s method to create a user friendly print out of your object.
class MyCar2

  def initialize(model)
    @model = model
  end
  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} miles per gallon of gas"
  end

  def to_s
    "Nice car is a #{@model}"
  end
end

puts MyCar2.gas_mileage(13, 351)
m3 = MyCar2.new('bmw')
puts m3
