require 'open-uri'
require_relative 'constant'
require 'csv-mapper'
require 'sqlite3'
require 'active_record'
require_relative 'main_data'

Date::DATE_FORMATS[:default] = '%F'
Time::DATE_FORMATS[:db]      = '%F' # without '00:00:00' in db

#donwload CSV file
donwload = open(URL)
File.open('test1.csv', "wb") do |file|
  file.write open(donwload).read
end

#create connection
ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

# create table
ActiveRecord::Schema.define do
  create_table :main_data, force: true do |t|
    t.date     :date
    t.float    :course
  end
end

#import data from CSV to DB
include CsvMapper

results = import('test1.csv') do
  map_to MainData
  after_row lambda{ |row, data| data.save }

  start_at_row 5
  [date, course]
end

class Exchanger < MainData

  def self.exchange(count, date)
    if date.size == 0
      raise ArgumentError.new('Date is empty!')
    end
    if date.kind_of?(Array)
      results = []
      date.each do |d|
        results << count * rate(d)
      end
      results
    else
      result = count * rate(date)
    end
  end
end
