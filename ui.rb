# DC Metro UI

require "./logic.rb"
require "./data.rb"

# UI ---------------------------------------------------------------------
stops_entered = []

puts "Here's an overview of the metro system:"
puts dc_metro.each {|line, stop| puts "\n#{line.upcase}:\n is #{stop.each{ |line| puts line}}" }


puts "Enter two metro station names to see the number of stops between them: "

while stops_entered.count < 2
   stops_entered<<gets.chomp 
end
puts trip(stops_entered[0],stops_entered[1]).abs