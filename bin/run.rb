require_relative '../lib/server'
require 'optparse'

SORT_METHODS = %w[gender birth_date name]

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: run.rb [options]'

  opts.on('-i', '--input-file FILE', 'File of records to import') do |i|
    options[:input_file] = i
  end
  opts.on('-s', '--sort-method METHOD', 'Method to sort by (gender, birth_date, or name)') do |s|
    options[:sort] = s
  end
  opts.on('-h', '--help', 'Display help') do
    puts opts
    exit
  end
end.parse!

raise 'Must specify an input file' if options[:input_file].nil?
raise "sort-method must be one of: #{SORT_METHODS.join(', ')}" if options[:sort].nil? || !SORT_METHODS.include?(options[:sort])

server = Server.new(options[:input_file])
puts server.send("records_by_#{options[:sort]}").join("\n")
