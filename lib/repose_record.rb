require 'date'

class SleepyGuard
  include Comparable
  attr_reader :guard_id

  def initialize(guard_id)
    @guard_id = guard_id
    @shift = Array.new(60, 0)
  end

  def book_sleep_time(start, finish)
    (start..finish-1).each do |n|
      @shift[n] += 1
    end
  end

  def minutes_slept
    @shift.sum
  end

  def most_slept_minute
    @shift.index(@shift.max)
  end

  def times_slept_at_most_slept_minute
    @shift.max
  end

  def <=>(other_sleepyest_guard)
    minutes_slept <=> other_sleepyest_guard.minutes_slept
  end 
end

class ReposeRecord
  attr_reader :guard_list

  def initialize
    @guard_list = Hash.new
  end

  def load_file(filename)
    lines = File.readlines(filename).sort
    load_data(lines)
  end
  
  def load_data(lines)
    guard_id = 0
    falls_sleep = 0
  
    lines.each do |l|      
      m = l.match(/^\[\d{4}-\d{2}-\d{2}\s\d{2}:(?<min>\d{2})\]\s(?<action>.*)$/)
      min = m[:min].to_i

      case m[:action][0..4]
      when "Guard"
        guard_id = m[:action].match(/#(\d+)/)[1].to_i
        @guard_list[guard_id] = SleepyGuard.new(guard_id) unless @guard_list.key?(guard_id)
      when "falls"
        falls_sleep = min
      when "wakes"
        @guard_list[guard_id].book_sleep_time(falls_sleep, min)
      end
    end
  end

  def sleepyest_guard
    @guard_list.values.max
  end

  def sleepyest_minute_guard
    sleepy = nil
    @guard_list.values.each do |guard|
      sleepy = guard if not sleepy
      sleepy = guard if guard.times_slept_at_most_slept_minute > sleepy.times_slept_at_most_slept_minute
    end
    sleepy
  end

  def sleepy_guard_times_minute
    sleepyest_guard.guard_id * sleepyest_guard.most_slept_minute
  end

  def sleepy_minute_times_guard
    return sleepyest_minute_guard.guard_id * sleepyest_minute_guard.most_slept_minute
  end 
end