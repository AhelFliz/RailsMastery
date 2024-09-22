# frozen_string_literal: true

# One class per file. Every time you create a new class, you should create a new file for it to live in.
# It is convention to put all your Ruby files into a lib directory. For example:

# project_name
# ├── lib
# │   └── lovely_file_of_yours.rb
# └── main.rb


# Making use of multiple files
#
# ├── lib
# │   ├── sort
# │   │   ├── bogo_sort.rb
# │   │   ├── bubble_sort.rb
# │   │   └── merge_sort.rb
# │   └── sort.rb
# └── main.rb
#
# You're in the root of the project, the directory that holds main.rb
#
# main.rb
# require_relative 'lib/sort'
#
# sort.rb
# require_relative 'sort/bubble_sort'
# require_relative 'sort/bogo_sort'
# require_relative 'sort/merge_sort'
#


# You're in the root of the project, the directory that holds main.rb

# This is your file structure:
# ├── lib
# │    ├── flight.rb
# │    ├── hotel.rb
# │    └── airport.rb
# └── main.rb

# lib/airport.rb
class Airport
  def introduce
    puts "I'm at the airport!"
  end
end

# lib/flight.rb
class Flight
  def introduce
    puts "I'm on the flight!"
  end
end

# lib/hotel.rb
class Hotel
  def introduce
    puts "I'm at the hotel!"
  end
end

# main.rb
require_relative 'lib/airport'
require_relative 'lib/flight'
require_relative 'lib/hotel'

Airport.new.introduce
#=> I'm at the airport!

Flight.new.introduce
#=> I'm on the flight!

Hotel.new.introduce
#=> I'm at the hotel!


require 'colorize'

puts 'Red goes faster!'.colorize(:red)

puts "I'm blue da ba dee da ba di!".colorize(:blue)

puts "It ain't easy bein' green...".colorize(:green)

