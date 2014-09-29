# takes the line and stop that a user is getting on at and the line and 
# stop that user is getting off at and prints the total number of stops for the trip

#data ---------------------------------------------------------------------
@red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
@turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
@orange = ['Farragut West', 'McPherson Sq', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

def make_line_into_spokes(line_color)
  temp = []
  temp << line_color[0..line_color.find_index("Metro Center")].reverse
  temp << line_color[line_color.find_index("Metro Center")..line_color.length]
  temp
end

def build_array(*lines)
  stop_array =[]
  stop_array << lines.map { |line| make_line_into_spokes(line) }
  stop_array.flatten(2)
end

#build data structure
@stop_array = build_array(@red, @orange, @turquoise)

# logic -----------------------------------------------------------------
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

# UI ---------------------------------------------------------------------
stops_entered = []

puts "Enter two metro station names to see the number of stops between them: "

while stops_entered.count < 2
   stops_entered<<gets.chomp 
end
puts trip(stops_entered[0],stops_entered[1]).abs