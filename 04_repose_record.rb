require_relative 'lib/repose_record'

rr = ReposeRecord.new
rr.load_file "input/04_input.txt"

puts "Part 1 - #{rr.sleepy_guard_times_minute}"
puts "Part 2 - #{rr.sleepy_minute_times_guard}"