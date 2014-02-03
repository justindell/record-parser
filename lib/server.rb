require_relative 'record'

class Server
  attr_reader :records

  def initialize file_name
    @records = []
    File.readlines(file_name).each do |line|
      @records << Record.new(line)
    end
  end

  def records_by_gender
    @records.sort{|a,b| [a.gender, a.last_name] <=> [b.gender, b.last_name]}
  end

  def records_by_birth_date
    @records.sort{|a,b| a.date_of_birth <=> b.date_of_birth}
  end

  def records_by_last_name
    @records.sort{|a,b| b.last_name <=> a.last_name}
  end
end
