@stop_array = [
    ["metro center", "crystal city"],
    ["metro center", "shaw-howard", "beltwater"],
    ["metro center", "farragut north", "dupont circle", "woodley park"],
    ["metro center", "judiciary square", "union station"],
    ["metro center", "mcpherson square", "farragut west"],
    ["metro center", "federal triangle", "smithsonian", "lenfant plaza"]
]

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
