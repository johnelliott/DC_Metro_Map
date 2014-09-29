# data

# @stop_array = [
#     ["metro center", "crystal city"],
#     ["metro center", "shaw-howard", "beltwater"],
#     ["metro center", "farragut north", "dupont circle", "woodley park"],
#     ["metro center", "judiciary square", "union station"],
#     ["metro center", "mcpherson square", "farragut west"],
#     ["metro center", "federal triangle", "smithsonian", "lenfant plaza"]
# ]

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

# build map for UI
dc_metro = {}
dc_metro[:red] = @red
dc_metro[:turquoise] = @turquoise
dc_metro[:orange] = @orange