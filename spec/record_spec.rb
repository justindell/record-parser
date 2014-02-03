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

  describe 'when displaying a record' do
    def setup
      @record = Record.new('Smith John Male Orange 1986-08-11')
    end

    it 'should be json' do
      @record.to_json.must_equal({'last_name' => 'Smith', 'first_name' => 'John', 'gender' => 'Male', 'date_of_birth' => '08/11/1986', 'favorite_color' => 'Orange' }.to_json)
    end

    it 'should be a formatted string' do
      @record.to_s.must_equal 'Smith, John, Male, 08/11/1986, Orange'
    end
  end
end
