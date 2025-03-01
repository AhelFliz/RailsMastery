# frozen_string_literal: true

# JSON (JavaScript Object Notation) is a lightweight, human-readable data interchange format. It’s widely used for
# transmitting data in web applications due to its simplicity and compatibility with many programming languages.
# JSON uses a key-value pair structure similar to Ruby hashes and arrays, making it easy to parse and generate.

# Object to json
require 'json'

person = { name: 'Angel', birthday: '1984-06-30' }
puts person

person_json = person.to_json
puts person_json

File.write('Ruby/04 Files and Serialization/data.json', person_json)

# JSON to object
ruby_object = JSON.parse(person_json)
puts ruby_object


pretty_json = JSON.pretty_generate(ruby_object)
puts pretty_json
File.write('Ruby/04 Files and Serialization//data.json', pretty_json)
