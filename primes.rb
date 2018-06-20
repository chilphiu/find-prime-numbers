#!/usr/bin/env ruby
#
require 'optparse'
require './app/multiplication_table'
require './app/primes_finder'

$primes_to_find = 10

OptionParser.new do |parser|
  parser.on("-n", "--number NUMBER", "The number of primes to find.") do |v|
    $primes_to_find = v.to_i
  end
end.parse!

primes = Primes_Finder.new($primes_to_find)
table = Multiplication_Table.new(primes.primes_array)
table.output_table

