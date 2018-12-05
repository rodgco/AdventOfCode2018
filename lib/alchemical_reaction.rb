class AlchemicalReaction
  def self.scan(material)
    buffer = String.new(capacity: material.size)
    material.each_char do |c|
      if buffer[-1] == c.swapcase then
        buffer[-1] = ""
      else
        buffer << c
      end
    end
    buffer.length
  end

  def self.reducer(material)
    result = Hash.new
    (?a..?z).map do |unit|
      result[unit] = self.scan2(material.tr(unit+unit.upcase, ""))
    end.min
  end
end