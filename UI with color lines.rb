# UI with lines---------------------------------------------------------

dc_metro = {}
dc_metro[:red] = @red
dc_metro[:turquoise] = @turquoise
dc_metro[:orange] = @orange 
# - The user should be asked what line they want to get on
puts "What line would you like to start from? (red, orange, turquoise)"
start_line = gets.chomp
#   - The user should be given a list of all the stops on that line
puts dc_metro[:start_line]
#   - The user should be able to enter the stop that they want to get on at
puts "What station would you like to board at?"
start_station = gets.chomp
#   - The user should be asked what line they want to get off
puts "What line would you like to go to?"
finish_line = gets.chomp
#   - The user should be given a list of all the stops on that line
puts dc_metro[:finish_line]
#   - The user should be able to enter the stop that they want to get off at
puts "What station would you like to board at?"
start_station = gets.chomp
#   - The user should be told the number of stops for their trip