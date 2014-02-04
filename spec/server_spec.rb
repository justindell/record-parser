require File.dirname(__FILE__) + '/spec_helper'

describe Server do
  let(:server) { Server.new(File.dirname(__FILE__) + '/data/input.txt') }

  describe 'when importing a file' do
    it 'must create a list of records' do
      server.records.count.must_equal 4
    end
  end

  describe 'when outputting records' do
    it 'must sort by gender and last name ascending' do
      assert_sorted_records server.records_by_gender, 'June Anderson', 'Jane Roe', 'Jim Brown', 'John Smith'
    end
    it 'must sort by birth date ascending' do
      assert_sorted_records server.records_by_birth_date, 'John Smith', 'Jim Brown', 'June Anderson', 'Jane Roe'
    end
    it 'must sort by last name descending' do
      assert_sorted_records server.records_by_name, 'John Smith', 'Jane Roe', 'Jim Brown', 'June Anderson'
    end
  end
end
