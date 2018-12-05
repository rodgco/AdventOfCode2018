class ChronalCalibration
  attr_reader :initial_frequency

  def initialize(n = 0)
    @initial_frequency = n
    @input = Array.new
  end

  def calculate_frequency
    return @initial_frequency + @input.sum
  end

  def reach_twice
    frequency = @initial_frequency
    seen = Hash.new(0)
    seen[frequency] += 1
    @input.cycle do |n|
      frequency += n
      seen[frequency] += 1
      return frequency if seen[frequency] == 2
    end
  end

  def load_file(filename)
    File.open(filename).each do |l|
      @input << l.to_i
    end
  end

  def load_array(input)
    @input = input.dup
  end
end
