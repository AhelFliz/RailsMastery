#Concatenation

# With the plus operator:
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"

# With the shovel operator:
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"

# With the concat method:
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"


#Substrings

"hello"[0]      #=> "h"

"hello"[0..1]   #=> "he"

"hello"[0, 4]   #=> "hell"

"hello"[-1]     #=> "o"


#Interpolation

name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello, #{name}' #=> "Hello, #{name}"


"hello".capitalize #=> "Hello"


"hello".include?("lo")  #=> true

"hello".include?("z")   #=> false

"hello".upcase  #=> "HELLO"

"Hello".downcase  #=> "hello"

"hello".empty?  #=> false

"".empty?       #=> true

"hello".reverse  #=> "olleh"

"hello world".split  #=> ["hello", "world"]

" hello, world   ".strip  #=> "hello, world"

"he77o".sub("7", "l")           #=> "hel7o"

"he77o".gsub("7", "l")          #=> "hello"

"hello".insert(-1, " dude")     #=> "hello dude"

"hello world".delete("l")       #=> "heo word"

"!".prepend("hello, ", "world") #=> "hello, world!"

5.to_s        #=> "5"

nil.to_s      #=> ""

:symbol.to_s  #=> "symbol"


"string" == "string"  #=> true

"string".object_id == "string".object_id  #=> false

:symbol.object_id == :symbol.object_id    #=> true
