require_relative "lib/chronal_calibration"

cc = ChronalCalibration.new

cc.load_file "input/01_input.txt"

puts "Part 1 - #{cc.calculate_frequency}"
puts "Part 2 - #{cc.reach_twice}"