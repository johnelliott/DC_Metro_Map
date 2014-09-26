# @stop_hash = {
# :crystal_city => ["metro center", "crystal city"],
# :belt_water => ["metro center", "shaw-howard", "beltwater"],
# :woodley_park => ["metro center", "farragut north", "dupont circle", "woodley park"],
# :union_station => ["metro center", "judiciary square", "union station"],
# :farragut_west => ["metro center", "mcpherson square", "farragut west"],
# :lenfant_plaza => ["metro center", "federal triangle", "smithsonian", "lenfant plaza"]}

# def stopFind(stop1, stop2)
#    @stop_hash.each do |stop|
#       index1 = stop.index(stop1)
#    end
#    @stop_hash.each do |stop|
#       index2 = stop.index(stop2)
#    end
#    puts index1 + index2
# end

# stopFind("metro center", "crystal city")
require 'pry'

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
    return @stop_array.map { |line| line.include?(beginning_stop) && line.include?(ending_stop) }.include?(true)
end

def trip(beginning_stop, ending_stop)
    unless same_line?(beginning_stop, ending_stop)
      count_stops_to_hub(beginning_stop) + count_stops_to_hub(ending_stop)
    else
      count_stops_to_hub(ending_stop) - count_stops_to_hub(beginning_stop)
    end
end

#tests

trip("federal triangle", "smithsonian")   # Expect => 1
trip("federal triangle", "beltwater")     # Expect => 3
