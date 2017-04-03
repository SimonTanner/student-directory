# This is a program to print itself

puts "The current file is called #{File.basename(__FILE__)}"
puts "And here are the contents:\n\n"

filename = __FILE__

file = File.open(filename, "r")

file.readlines.each {|line| puts line}

# The end!!!