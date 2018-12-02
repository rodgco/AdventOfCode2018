class Box
  attr_reader :boxId

  def initialize(boxId)
    @boxId = boxId
    counter = Hash.new(0)
    boxId.chars.each do |c|
      counter[c] += 1
    end
    @has_duples = counter.invert.key?(2)
    @has_triples = counter.invert.key?(3)
  end

  def has_duples?
    @has_duples
  end

  def has_triples?
    @has_triples
  end
end

class Array
  def compare_with(other)
    result = Array.new
    self.each_with_index do |v, i|
      result << (v == other[i])
    end
    return result
  end
end

class InventoryManagementSystem
  def initialize
    @boxes = Array.new
  end

  def load_file(filename)
    File.open(filename).each do |l|
      @boxes << Box.new(l.delete("\n"))
    end
  end

  def checksum
    count_duples, count_triples = [0,0]
    @boxes.each do |b|
      count_duples += 1 if b.has_duples?
      count_triples +=1 if b.has_triples?
    end
    return count_duples * count_triples
  end

  def find_common_letters_of_correct_boxes
    @boxes.each_with_index do |b1, i|
      @boxes[i..@boxes.length-1].each do |b2|
        comparison_map = b1.boxId.chars.compare_with(b2.boxId.chars)
        if comparison_map.count(false) == 1 then
          return comparison_map.map.with_index {|v,i| b1.boxId.chars[i] if v}.join
        end
      end
    end
    return "Failed!"
  end
end