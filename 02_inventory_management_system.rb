require_relative 'lib/inventory_management_system'

ims = InventoryManagementSystem.new

ims.load_file "day2/input.txt"

puts "Part 1 - #{ims.checksum}"
puts "Part 2 - #{ims.find_common_letters_of_correct_boxes}"