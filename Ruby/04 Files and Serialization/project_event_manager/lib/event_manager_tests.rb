# frozen_string_literal: true

# content = File.read('Ruby/04 Files and Serialization/project_event_manager/lib/event_attendees.csv')
# puts content
#
#
# lines = File.readlines('Ruby/04 Files and Serialization/project_event_manager/lib/event_attendees.csv')
# lines.each do |line|
#   puts line
# end

# array of each colum
# lines = File.readlines('Ruby/04 Files and Serialization/project_event_manager/lib/event_attendees.csv')
# lines.each do |line|
#   columns = line.split(',')
#   name = columns[2]
#   p name
# end

# lines = File.readlines('Ruby/04 Files and Serialization/project_event_manager/lib/event_attendees.csv')
#
# # Skipping the header row
# lines.each do |line|
#   next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
#
#   columns = line.split(',')
#   puts columns[2] # names
# end
#
# # Tracking the index
# lines.each_with_index do |line, index|
#   next if index.zero?
#
#   columns = line.split(',')
#   puts columns[2]
# end

# Using the csv library

# contents = CSV.open('Ruby/04 Files and Serialization/project_event_manager/lib/event_attendees.csv', headers: true)
# contents.each do |row|
#   name = row[2]
#   puts name
# end

# Accessing columns by their names
# Moving clean zip codes to a method
# if the zip code is exactly five digits, assume that it is ok
# if the zip code is more than five digits, truncate it to the first five digits
# if the zip code is less than five digits, add zeros to the front until it becomes five digits

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(address: zip,
                                              levels: 'country',
                                              roles: %w[legislatorUpperBody legislatorLowerBody]).officials
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, from_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts from_letter
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  '04 Files and Serialization/project_event_manager/lib/event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('04 Files and Serialization/project_event_manager/lib/event_attendees.csv')
erb_template = ERB.new(template_letter)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
end
