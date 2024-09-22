if 1 < 2
  puts "Hot diggity, 1 is less than 2!"
end

puts "Hot diggity damn, 1 is less than 2" if 1 < 2


#Adding else and elsif

if attack_by_land == true
  puts "release the goat"
else
  puts "release the shark"
end


if attack_by_land == true
  puts "release the goat"
elsif attack_by_sea == true
  puts "release the shark"
else
  puts "release Kevin the octopus"
end


5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true


a = 5
b = 5
a.equal?(b) #=> true


if 1 < 2 && 5 < 6
  puts "Party at Kevin's!"
end

# This can also be written as
if 1 < 2 and 5 < 6
  puts "Party at Kevin's!"
end


if !false     #=> true

if !(10 < 5)  #=> true


grade = 'F'

case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "'YOU SHALL NOT PASS!' -Gandalf"
  fml = true
end


# Unless statements

# An unless statement works in the opposite way as an if statement: it only processes 
# the code in the block if the expression evaluates to false. There isn’t much more to it.

age = 19
puts "Welcome to a life of debt." unless age < 18

unless age < 18
  puts "Down with that sort of thing."
else
  puts "Careful now!"
end


# Ternary operator
# Its syntax is conditional statement ? <execute if true> : <execute if false>. 
# You can assign the return value of the expression to a variable.

age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."
  

# Writing this as an if...else statement would be much more verbose:
  
age = 19
if age < 18
  response = "You still have your entire life ahead of you."
else
  response = "You're all grown up."
end

puts response #=> "You're all grown up."
  
