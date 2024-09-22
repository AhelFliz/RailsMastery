# Debugging with puts 

def add_two_numbers(a, b)
  result = a + b
  p result  # gives more detailed info
  result
end

add_two_numbers(2, 3)


# Debugging with pry-byebug

gem install pry-byebug

require 'pry-byebug'

def add_two_numbers(a, b)
  binding.pry  # Execution will stop here, opening an interactive console
  result = a + b
  result
end

add_two_numbers(2, 3)

# When the code reaches binding.pry, it will pause
# and open an interactive console, allowing you to
# inspect variables and step through your code interactively.
# For example, you can type a, b, and result to see their values,
# and use commands like next to proceed to the next line of execution.