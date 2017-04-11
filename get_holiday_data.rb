require 'holidays'
require 'holidays/core_extensions/date'
require 'dotenv'
require_relative 'resource_accessor'
Dotenv.load

class Date
  include Holidays::CoreExtensions::Date
end

def get_dates start_time, end_time
  dates = []
  while start_time <= end_time
    dates.push start_time
    start_time += 1
  end
  dates
end

start_time = Date.parse(ENV['START_TIME'])
end_time = Date.parse(ENV['END_TIME'])
country = ENV['COUNTRY']

dates = get_dates(start_time, end_time)
resource_accessor = ResourceAccessor.new
resource_accessor.create_holiday_table

dates.each do |date|
  year = date.year.to_i
  month = date.month.to_i
  day = date.day.to_i
  holiday = date.holiday?(country.to_sym) ? 1 : 0
  weekday = date.wday.to_i
  resource_accessor.insert(year, month, day, holiday, weekday)
end
