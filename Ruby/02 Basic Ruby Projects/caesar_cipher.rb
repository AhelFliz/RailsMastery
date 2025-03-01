# Implement a caesar cipher that takes in a string
# and the shift factor and then outputs the modified string:
#
# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
#
# Quick Tips:
#
# You will need to remember how to convert a string into a number.
# Don’t forget to wrap from z to a.
# Don’t forget to keep the same case.

# My version
letters = ('a'..'z').to_a

def cessar_cipher(string, shift, letters)
  string_converted = ''

  string.each_char do |char|
    letters.each_with_index do |letter, index| 
      string_converted += letters[index - shift] if letter.eql?(char)
    end
  end
  string_converted
end

puts 'Enter the string to convert:'
string = gets.chomp

puts 'Now the shift:'
shift = gets.chomp.to_i

puts cessar_cipher(string, shift, letters)


# Correct version
letters = ('a'..'z').to_a

def caesar_cipher(string, shift, letters)
  string_converted = ''

  string.each_char do |char|
    if char.match?(/[a-z]/i) # Checks if the character is a letter
      is_upcase = char == char.upcase
      shifted_index = (letters.index(char.downcase) - shift) % 26
      shifted_char = letters[shifted_index]
      string_converted += is_upcase ? shifted_char.upcase : shifted_char
    else
      string_converted += char # Handles non-letter characters by adding them as they are
    end
  end
  string_converted
end

puts 'Enter the string to convert:'
string = gets.chomp

puts 'Now the shift:'
shift = gets.chomp.to_i

puts caesar_cipher(string, shift, letters)
