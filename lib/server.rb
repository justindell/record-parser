require_relative 'record'

class Server
  attr_reader :records

  def initialize file_name = nil
    @records = []
    if file_name
      File.readlines(file_name).each do |line|
        add_record(line)
      end
    end
  end

  def add_record line
    @records << Record.new(line)
  end

  def records_by_gender
    @records.sort{|a,b| [a.gender, a.last_name] <=> [b.gender, b.last_name]}
  end

  def records_by_birth_date
    @records.sort{|a,b| a.date_of_birth <=> b.date_of_birth}
  end

  def records_by_name
    @records.sort{|a,b| b.last_name <=> a.last_name}
  end
end
