class GoodDog
  # attr_reader :name only for read
  # attr_writer :name only for write
  # attr_accessor :name for read and write
  attr_accessor :name, :height, :weight

  def initialize(name, height, weight)
    @name = name
    @height = height
    @weight = weight
  end

  def change_info(nam, hei, wei)
    self.name = nam
    self.height = hei
    self.weight = wei
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
  def bark
    "#{@name} says WAU!"
  end
end

ares = GoodDog.new('Ares', '140', '20')
puts ares.bark
puts ares.name

ares.name = 'Nola'
puts ares.name

ares.change_info('Spartacus', '24 inches', '45 lbs')
puts ares.info