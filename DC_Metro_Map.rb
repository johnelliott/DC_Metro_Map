require 'pry'
require 'minitest/autorun'
require 'active_support/core_ext/integer/inflections'

class Metro

   def stop_array
       [["metro center", "crystal city"],
         ["metro center", "shaw-howard", "beltwater"],
         ["metro center", "farragut north", "dupont circle", "woodley park"],
         ["metro center", "judiciary square", "union station"],
         ["metro center", "mcpherson square", "farragut west"],
         ["metro center", "federal triangle", "smithsonian", "lenfant plaza"]]
   end

   def are_both_stops_on_the_same_line(stop1, stop2)
      if stop1 == "metro center"
         line = stop_array.find{|line| line.include? stop2}
         line.include?(stop1 && stop2)
      else
         line = stop_array.find{|line| line.include? stop1}
         line.include?(stop1 && stop2)
      end
   end

   def number_of_stops(stop1, stop2)
      if are_both_stops_on_the_same_line(stop1, stop2) == false
         distance_from_metro_center(stop1) + distance_from_metro_center(stop2)
      else
         output = distance_from_metro_center(stop1) - distance_from_metro_center(stop2)
         output.abs
      end
   end

   def distance_from_metro_center(stop)
       metro_line_for_this_stop = stop_array.find {|line| line.include? stop}
       metro_line_for_this_stop.index(stop)
   end

   def color_line_chooser(color)
      if color == "red"
         "Which station will you be headed to? \n #{(stop_array[2].reverse + stop_array[3]).uniq.join(' * ')}"
      elsif color == "blue"
         "Which station will you be headed to? \n #{(stop_array[0].reverse + stop_array[1]).uniq.join(' * ')}"
      else
         "Which station will you be headed to? \n #{(stop_array[4].reverse + stop_array[5]).uniq.join(' * ')}"
      end
   end

   def run
      puts "What color line are you starting your trip on?\n(red, blue, or orange)"
      color1 = gets.chomp.downcase
      puts color_line_chooser(color1)
      stop1 = gets.chomp.downcase
      puts  "What color line will you be headed to?\n(red, blue, or orange)"
      color2 = gets.chomp.downcase
      puts color_line_chooser(color2)
      stop2 = gets.chomp.downcase
      puts "**********************#{stop2} will be your #{number_of_stops(stop1, stop2).ordinalize} stop!**********************"
   end

   Metro.new.run

end
####### TESTS #######
class Test < MiniTest::Unit::TestCase

   def setup
      @metro = Metro.new
   end

   def test_are_both_on_same_line_checker
      assert_equal(false, @metro.are_both_stops_on_the_same_line("smithsonian", "judiciary square"))
      assert_equal(true, @metro.are_both_stops_on_the_same_line("federal triangle", "smithsonian"))
      assert_equal(true, @metro.are_both_stops_on_the_same_line("metro center", "farragut north"))
      assert_equal(true, @metro.are_both_stops_on_the_same_line("judiciary square", "metro center"))
   end

   def test_num_of_stops
      assert_equal(4, @metro.number_of_stops("smithsonian", "dupont circle"))
      assert_equal(1, @metro.number_of_stops("mcpherson square", "farragut west"))
      assert_equal(3, @metro.number_of_stops("metro center", "lenfant plaza"))
   end

   def test_distance_from_metro
      assert_equal(2, @metro.distance_from_metro_center("beltwater"))
      assert_equal(2, @metro.distance_from_metro_center("smithsonian"))
      assert_equal(0, @metro.distance_from_metro_center("metro center"))
   end

   def test_assert_equal
      assert_equal(1, 1)
   end

end