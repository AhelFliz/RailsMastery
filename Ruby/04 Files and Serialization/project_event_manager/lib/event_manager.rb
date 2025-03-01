# frozen_string_literal: true

require 'csv'
require 'irb'

CSV_FILE_PATH = '04 Files and Serialization/project_event_manager/lib/event_attendees.csv'
DAYS_OF_WEEK = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]

def clean_phone_number(number)
  cleaned = number.to_s.gsub(/[-().\s]/, '')
  # (cleaned.length == 11 && cleaned.start_with?('1')) || cleaned.length == 10 ? 'Valid phone number' : 'Invalid phone number'
  
  case cleaned.length
  when 10
    cleaned
  when 11
    cleaned.start_with?('1') ? cleaned[1..] : 'Invalid phone number'
  else
    'Invalid phone number'
  end
end

def convert_to_date(regdate)
  format = "%m/%d/%y %H:%M"
  DateTime.strptime(regdate, format)
end

def calculate_avg(avg_x)
  avg_x.sum.to_f / avg_x.size
end

def process_csv(path)
  hours_registered = []
  days_registered = []
  
  CSV.open(path, headers: true, header_converters: :symbol).each do |row|
    phone = clean_phone_number(row[:homephone])
    registration_date = convert_to_date(row[:regdate])
    
    hours_registered.append(registration_date.hour)
    days_registered.append(registration_date.wday)
    
    puts "#{phone} = #{ row[:homephone]}"
  end
  
  [hours_registered, days_registered]
end

hours_registered, days_registered = process_csv(CSV_FILE_PATH)
puts "The peak registration hour is: #{calculate_avg(hours_registered).round(2)}"
peak_day = calculate_avg(days_registered).round
puts "The peak registration day is: #{DAYS_OF_WEEK[peak_day]}"


# Part 1: Clean phone numbers
# Similar to the zip codes, the phone numbers suffer from multiple formats and inconsistencies. If we wanted to allow
# individuals to sign up for mobile alerts with the phone numbers, we would need to make sure all of the numbers are valid and well-formed.
#
# If the phone number is less than 10 digits, assume that it is a bad number
# If the phone number is 10 digits, assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the remaining 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits, assume that it is a bad number

# Part 2: Time targeting
# The boss is already thinking about the next conference: “Next year I want to make better use of our Google and Facebook
# advertising. Find out which hours of the day the most people registered, so we can run more ads during those hours.” Interesting!
#
# Using the registration date and time we want to find out what the peak registration hours are.
#
#   Ruby has Date and Time classes that will be very useful for this task.
#
#   For a quick overview, check out this Ruby Guides article.
#
#   Explore the documentation to become familiar with the available methods, especially #strptime, #strftime, and #hour.

# Part 3: Day of the week targeting
# The big boss gets excited about the results from your hourly tabulations. It looks like there are some hours that are
# clearly more important than others. But now, tantalized, she wants to know “What days of the week did most people register?”
#
# Use Date#wday to find out the day of the week.
