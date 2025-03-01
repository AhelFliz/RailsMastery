# Basic

grade = 'C'

case grade
when 'A'
  puts 'Amazing effort'
when 'C'
  puts 'Well done'
else
  puts 'Invalid one'
end

###

login = { username: 'hornby', password: 'iliketrains' }

login => { username: username }

puts "Logged in with username #{username}"

###

# Return Values

result = case grade
  in 'A' then 1
  in 'C' then 3
else 0
end

puts result

# Object pattern match

input = 3

case input
  in String then puts "input was a type of String"
  in Integer then puts "input was a type of Integer"
end

# Variable pattern

age = 15

case age
  in a
  puts a
end
# => 15

a = 5

case 1
  in a
  puts a
end
#=> 1

# A pattern match

case 3
when 3 => a
  puts a 
end

# Alternative pattern match

case 0
  in 0 | 1 | 2
  puts :match
end

# Guard condition 

some_other_value = true

case 0
  in 0 if some_other_value
  puts :match
end

# Array pattern match

arr = [1, 2]

case arr
  in [1, 2] then puts :match 
  in [3, 4] then puts :no_match
end

case arr
  in [Integer, Integer]
    puts :match
  in [String, String]
    puts :no_match
end

arr2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr2
in [Integer, Integer, *, Integer, Integer]
  puts :match
end

# Hash pattern matching

case { a: 'apple', b: 'banana' }
in { a: 'aardvark', b: 'bat' }
  puts :no_match
in { a: 'apple', b: 'banana' }
  puts :match
end

# => match

case { a: 'apple', b: 'banana' }
in { a: a, b: b }
  puts a
  puts b
end

# => apple
# => banana

case { a: 'apple', b: 'banana' }
in a:, b:
  puts a
  puts b
end

# => apple
# => banana

case { a: 'ant', b: 'ball', c: 'cat' }
in { a: 'ant', **rest }
  p rest
end

# => { :b => "ball", :c => "cat" }

# Find pattern

data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

name = 'Jill'
age = 32
job_title = 'leet coder'

match = data.find do |person|
  person[:name] == name && person[:age] == age && person[:job_title] == job_title
end

match&.fetch(:first_language)

###

case data
in [*, { name: ^name, age: ^age, first_language: first_language, job_title: ^job_title }, *]
else
  first_language = nil
end

puts first_language


# https://docs.ruby-lang.org/en/3.3/syntax/pattern_matching_rdoc.html

# Diferencia clave con el uso de in:

# in (coincidencia de patrones): Comprueba si el hash del case contiene la estructura y los valores especificados en el patrón. Permite extraer valores y asignarlos a variables.
# when (comparación estricta): Comprueba si el valor del case es idéntico al valor especificado en la cláusula when. No hay extracción de valores ni coincidencia de patrones.
# ¿Cuándo usar when y cuándo usar in?

# when: Úsalo para comparaciones de igualdad simples, como verificar si una variable tiene un valor específico o si un objeto es igual a otro.
# in: Úsalo cuando necesites:
# Verificar la estructura de un objeto (por ejemplo, si un hash tiene ciertas claves).
# Verificar si los valores dentro de un objeto coinciden con ciertos patrones.
# Extraer valores de un objeto y asignarlos a variables.
