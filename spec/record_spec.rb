require File.dirname(__FILE__) + '/spec_helper'

describe Record do
  describe 'when parsing a file' do
    it 'must accept pipe delimited' do
      record_matches Record.new('Smith | John | Male | Orange | 1986-08-11'), 'Smith', 'John', 'Male', 'Orange', Date.new(1986,8,11)
      record_matches Record.new('Smith | Jane | Female | Blue | 1989/08/11'), 'Smith', 'Jane', 'Female', 'Blue', Date.new(1989,8,11)
    end

    it 'must accept comma delimited' do
      record_matches Record.new('Smith, John, Male, Orange, 1986-08-11'), 'Smith', 'John', 'Male', 'Orange', Date.new(1986,8,11)
      record_matches Record.new('Smith, Jane, Female, Blue, 1989/08/11'), 'Smith', 'Jane', 'Female', 'Blue', Date.new(1989,8,11)
    end

    it 'must accept space delimited' do
      record_matches Record.new('Smith John Male Orange 1986-08-11'), 'Smith', 'John', 'Male', 'Orange', Date.new(1986,8,11)
      record_matches Record.new('Smith Jane Female Blue 1989/08/11'), 'Smith', 'Jane', 'Female', 'Blue', Date.new(1989,8,11)
    end
  end
end
