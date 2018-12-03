require_relative 'lib/fabric_slicer'

fs = FabricSlicer.new

fs.load_file "day3/03_input.txt"

puts "Part 1 - #{fs.calculate_overlaping_area}"
puts "Part 2 - #{fs.find_unoverlaped_claim}"