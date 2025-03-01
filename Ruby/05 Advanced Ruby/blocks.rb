array = [1, 2, 4, 5]

# Single-line block 
array.each { |num| puts num}

# Multiple-line block
array.each do |num|
  puts num
end

# Yield

def double_vision
  yield
  yield
end

double_vision { puts "How many fingers I'm holding up?"}
double_vision { array.each {|num| puts num} }

def love_language
  yield("Ruby")
  yield("Rails")
end

love_language { |lang| puts "I love #{lang}"}

###

@transactions = [213, 4321, 35, -123, 50, -3423]

def transactions_statement
  @transactions.each do |tx|
    yield tx
  end
end

# Imprimir las transacciones formateadas
transactions_statement do |tx|
  puts "%0.2f" % tx
end

# Calcular la suma de las transacciones
sum = 0
transactions_statement do |tx|
  sum += tx
end
puts "Sum: #{sum}"

# Encontrar la transacción más grande
largest = @transactions.first
transactions_statement do |tx|
  largest = tx if tx > largest
end

puts "Largest: #{largest}"

###

# Guardar en un array 

def transactions_statement
  array_formatted_tx = []
  @transactions.each do |tx|
    array_formatted_tx << yield(tx)
  end
end
  
transactions_statement do |tx|
  "%0.2f" % tx
end


def awesome_method
  hash = {a: 'apple', b: 'banana', c: 'cookie'}
  
  hash.each do |key, value|
    yield key, value
  end
end

awesome_method { |key, value| puts "#{key}: #{value}"}
  
# Block control 

def maybe_block
  if block_given?
    puts "block party"
  end
  puts "executed regardless"
end

maybe_block #=> executed regardless

maybe_block {} # empty block
# => block party
# => executed regardless

# Lambdas
#Way of write a block and save it into a variable 
  
my_lambda = lambda { puts "my lambda"}
my_other_lambda = -> { puts "the other lambda"}

my_lambda.call # for call a lambda we use the method call 
#=> my lambda

# for accept arguments
my_name = ->(name) { puts "my name is #{name}" }
my_age = lambda { |age| puts "I'm #{age} years old"}

my_name.call("Angel")
my_age.call(21)

# differents ways of call a lambda
my_name.call("tim")
my_name.("tim")
my_name["tim"]
my_name.=== "tim"

# Process 
# A proc is just an object that you can use to store blocks and pass them around like variables.

a_proc = Proc.new { puts "This is a proc" }
a_proc.call

b_proc = Proc.new { |name, age| puts "name: #{name}, age: #{age}"}
b_proc.call("Angel", 21)

# For a lambda must the pass exactly the arguments necessary or will return a error, for a process no 

def my_method
  a_proc = Proc.new { return }
  puts "This line will be printed"
  a_proc.call
  puts "This call will never be printed"
end

my_method


# Similarities

my_proc = Proc.new { |name="bob"| puts name }

my_proc.call
# => bob

my_lambda = ->(name="r2d2") { puts name }

my_lambda.call
# => r2d2


def similar_method(useful_args)
  useful_args.call
end

similar_method(a_proc)
similar_method(my_lambda)

# Capturing blocks
# Ruby nos permite capturar bloques en una definición de método como un argumento especial usando &.
# If your method names some other parameters, then the block-capturing & parameter should always go las
def cool_method(&my_block)
  my_block.call
end

cool_method { puts "cool_method is capturing this block" }

# to_proc

proc = :to_s.to_proc   # => #<Proc:0x000001afe0e48680(&:to_s) (lambda)>
proc.call(1000)        # => "1000"
proc.call(1000, 16)    # => "3e8"
(1..3).collect(&:to_s) # => ["1", "2", "3"]

arr = ["1", "2", "3"]

arr.map(&:to_i)
# => [1, 2, 3]

def cool_method3
  yield
end

my_proc = Proc.new { puts "proc party" }
cool_method3(&my_proc)

### 

def cool_method(an_arg)
  an_arg.call
end

a_proc = Proc.new { puts "procodile hunter" }

cool_method(&a_proc) # Converting the proc object to a block

# => ArgumentError (wrong number of arguments (given 0, expected 1))










