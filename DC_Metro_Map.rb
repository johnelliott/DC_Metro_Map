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

# puts @stop_array.index("metro center")

def stopFind(stop1, stop2)
   index1 = 0
   index2 = 0

   @stop_array.each do |line|
      index1 = line.index(stop1)
   end
   @stop_array.each do |line|
      index2 = line.index(stop2)
      puts index2
   end
   binding.pry
   output = index1 + index2

   puts output.to_s
end

stopFind("beltwater", "crystal city")