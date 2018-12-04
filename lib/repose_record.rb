require 'date'

class ReposeRecord
  def initialize
    @sleep_count = Hash.new(0)
    @sleep_map = Hash.new
  end

  def load_file(filename)
    events = Hash.new
    File.open(filename).each_line do |l|
      m = l.match(/^\[(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})\s(?<hour>\d{2}):(?<min>\d{2})\]\s(?<action>.*)$/)
      events[DateTime.new(m[:year].to_i,m[:month].to_i,m[:day].to_i,m[:hour].to_i,m[:min].to_i)] = m[:action]
    end

    guard_id = 0
    falls_sleep = 0
    wakes_up = 0

    events.keys.sort.each do |k|      
      case events[k][0..4]
      when "Guard"
        guard_id = events[k].match(/#(\d+)/)[1].to_i
        @sleep_map[guard_id] = Array.new(60, 0) unless @sleep_map[guard_id]
      when "falls"
        falls_sleep = k.min
      when "wakes"
        @sleep_count[guard_id] += k.min - falls_sleep
        (falls_sleep..k.min-1).each do |m|
          @sleep_map[guard_id][m] += 1
        end
      end
    end
  end

  def sleepy_guard_times_minute
    sleepy_guard = @sleep_count.key(@sleep_count.values.max)
    sleepy_minute = @sleep_map[sleepy_guard].index(@sleep_map[sleepy_guard].max)
    return sleepy_guard * sleepy_minute
  end

  def sleepy_minute_times_guard
    times_sleepy_minute_for_each_guard = Hash.new
    @sleep_map.each_pair do |k,v|
      times_sleepy_minute_for_each_guard[k] = v.max
    end
    sleepy_guard = times_sleepy_minute_for_each_guard.key(times_sleepy_minute_for_each_guard.values.max)
    sleepy_minute = @sleep_map[sleepy_guard].index(times_sleepy_minute_for_each_guard[sleepy_guard])
    return sleepy_guard * sleepy_minute
  end
end