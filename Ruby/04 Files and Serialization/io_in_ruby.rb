# frozen_string_literal: true

# Reading files

content = File.read('Ruby/04 Files and Serialization/filename.txt')
puts content

# File.readlines
content2 = File.readlines('Ruby/04 Files and Serialization/filename.txt')
content2.each { |line| puts line }

# Files.foreach
File.foreach('Ruby/04 Files and Serialization/filename.txt') do |line|
  puts line
end


# Writing files

# File.write
File.write('/Users/angel/Coding/MasterRB/RailsMastery/Ruby/04 Files and Serialization/filename.txt', 'klk number 1')

# File.open
File.open('/Users/angel/Coding/MasterRB/RailsMastery/Ruby/04 Files and Serialization/filename.txt', 'w') do |file|
  file.write('klk number 2')
end

# Appending Text to a File
File.open('/Users/angel/Coding/MasterRB/RailsMastery/Ruby/04 Files and Serialization/filename.txt', 'a') do |file|
  file.write('klk number 3')
end

# Alternative
File.write('/Users/angel/Coding/MasterRB/RailsMastery/Ruby/04 Files and Serialization/filename.txt',
           'last klk number 4 ', mode: 'a')


content = File.read('/Users/angel/Coding/MasterRB/RailsMastery/Ruby/04 Files and Serialization/filename.txt')
puts content


# "r": Read-only. The file must exist.
# "w": Write-only. Creates a new file or truncates an existing file.
# "a": Append. Writes data to the end of the file. Creates the file if it doesn't exist.
# "r+": Read and write. The file must exist.
# "w+": Read and write. Creates a new file or truncates an existing file.
# "a+": Read and append. Reads from and writes to the end of the file. Creates the file if it doesn't exist.
