# DC Metro UI
require "./logic.rb"
# UI ---------------------------------------------------------------------
stops_entered = []

puts "Enter two metro station names to see the number of stops between them: "

while stops_entered.count < 2
   stops_entered<<gets.chomp 
end
puts trip(stops_entered[0],stops_entered[1]).abs