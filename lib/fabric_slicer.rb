class FabricSlicer
  attr_reader :overlaped_area
  def initialize(gridsize = 1000)
    @fabric = Array.new(gridsize) { Array.new(gridsize) {Array.new(0)}}
    @overlaped_area = 0
    @claim_map = Hash.new(false)
  end

  def load_file(filename)
    File.open(filename).each_line do |l|
      m = l.match(/^#(?<id>\d+)\s@\s(?<left>\d+),(?<top>\d+):\s(?<width>\d+)x(?<height>\d+)/)
      (m[:left].to_i..m[:left].to_i+m[:width].to_i-1).each do |c|
        (m[:top].to_i..m[:top].to_i+m[:height].to_i-1).each do |r|
          @fabric[c][r] << m[:id]
          @overlaped_area += 1 if @fabric[c][r].length == 2
          if @fabric[c][r].length > 1 then
            @fabric[c][r].each do |claim|
              @claim_map[claim] ||= true
            end
          else
            @claim_map[m[:id]] ||= false
          end 
        end
      end
    end
  end

  def calculate_overlaping_area
    # overlap = 0
    # (0..999).each do |c|
    #   (0..999).each do |r|
    #     overlap += 1 if @fabric[c][r] > 1
    #   end
    # end
    return @overlaped_area
  end

  def find_unoverlaped_claim
    return @claim_map.key(false)
  end
end