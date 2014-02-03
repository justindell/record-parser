require 'date'
require 'json'

class Record
  attr_reader :last_name, :first_name, :gender, :favorite_color, :date_of_birth

  def initialize line
    pieces = line.split(' | ')
    pieces = line.split(', ') if pieces.count == 1
    pieces = line.split(' ') if pieces.count == 1
    @last_name      = pieces[0]
    @first_name     = pieces[1]
    @gender         = pieces[2]
    @favorite_color = pieces[3]
    @date_of_birth  = Date.parse(pieces[4])
  end

  def full_name
    first_name + ' ' + last_name
  end

  def to_s
    "#{last_name}, #{first_name}, #{gender}, #{date_of_birth.strftime('%m/%d/%Y')}, #{favorite_color}"
  end

  def to_json *opts
    { last_name:      last_name,
      first_name:     first_name,
      gender:         gender,
      date_of_birth:  date_of_birth.strftime('%m/%d/%Y'),
      favorite_color: favorite_color }.to_json
  end
end
