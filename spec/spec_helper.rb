require 'simplecov'
SimpleCov.start do
  add_group 'Lib', '../lib'
  add_filter 'spec'
  command_name 'MiniTest'
end

require 'minitest/autorun'
require_relative '../lib/record'

def record_matches record, last, first, gender, color, dob
  record.first_name.must_equal     first
  record.last_name.must_equal      last
  record.gender.must_equal         gender
  record.favorite_color.must_equal color
  record.date_of_birth.must_equal  dob
end
