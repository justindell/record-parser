# Record Parser

Simple programming exercise that takes an input of records and returns sorted output.

## Command Line

    bundle exec ./bin/run.rb -i INPUT_FILE -s SORT_METHOD

The command line tool takes an input file of an agreed upon format and outputs the records based on the sorting algorithm used. Supported sorts are:
    "gender"
    "birth_date"
    "name"

## Web Server

    bundle exec rackup

Starts a web server backed by grape (https://github.com/intridea/grape). Supported api calls are:

    POST /records - Post a single data line in any of the 3 formats supported by your existing code
    GET /records/gender - returns records sorted by gender
    GET /records/birthdate - returns records sorted by birthdate
    GET /records/name - returns records sorted by name

## Development

Run the mini tests by executing:

    bundle exec rake

This will also run test coverage analysis using simplecov (https://github.com/colszowka/simplecov). Which can be viewed in coverage/index.html
