require 'simplecov'
SimpleCov.start do
  add_group 'Lib', '../lib'
  add_filter 'spec'
  command_name 'MiniTest'
end

require 'minitest/autorun'
require_relative "../lib/server"
require_relative '../lib/record'

def matches_record record, last, first, gender, color, dob
  record.first_name.must_equal     first
  record.last_name.must_equal      last
  record.gender.must_equal         gender
  record.favorite_color.must_equal color
  record.date_of_birth.must_equal  dob
end

def assert_sorted_records records, *names
  records.each_with_index do |record, index|
    record.full_name.must_equal names[index]
  end
end
