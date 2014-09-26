# takes the line and stop that a user is getting on at and the line and 
# stop that user is getting off at and prints the total number of stops for the trip

@stop_array = [
    ["metro center", "crystal city"],
    ["metro center", "shaw-howard", "beltwater"],
    ["metro center", "farragut north", "dupont circle", "woodley park"],
    ["metro center", "judiciary square", "union station"],
    ["metro center", "mcpherson square", "farragut west"],
    ["metro center", "federal triangle", "smithsonian", "lenfant plaza"]
]

# logic
def count_stops_to_hub(stop)
    @stop_array.map { |line| line.find_index(stop) }.compact[0]
end

def same_line?(beginning_stop, ending_stop)
    @stop_array.map { |line| line.include?(beginning_stop) && line.include?(ending_stop) }.include?(true)
end

def trip(beginning_stop, ending_stop)
    unless same_line?(beginning_stop, ending_stop)
      count_stops_to_hub(beginning_stop) + count_stops_to_hub(ending_stop)
    else
      count_stops_to_hub(ending_stop) - count_stops_to_hub(beginning_stop)
    end
end

# UI
stops_entered = []

puts "Enter two metro stops to see the number of stops between them: "

while stops_entered.count < 2
   stops_entered<<gets.chomp 
end
puts trip(stops_entered[0],stops_entered[1])