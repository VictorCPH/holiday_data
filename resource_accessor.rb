require 'mysql2'

class ResourceAccessor
  def initialize
    @client = Mysql2::Client.new(:host => ENV['HOST'], :username => ENV['USERNAME'],
                                 :password => ENV['PASSWORD'], :database => ENV['DATABASE'])
  end

  def create_holiday_table
    @client.query("create table if not exists holiday_data(
                    year integer,
                    month integer,
                    day integer,
                    holiday integer,
                    weekday integer
                )")
  end

  def insert year, month, day, holiday, weekday
    @client.query("insert into holiday_data values(#{year}, #{month}, #{day}, #{holiday}, #{weekday})")
  end
end
