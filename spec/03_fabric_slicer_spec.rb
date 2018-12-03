require 'fabric_slicer'

describe "Fabric Slicer" do
  it 'should find overlaping areas' do
    fs = FabricSlicer.new
    fs.load_file "day3/03_sample_part1.txt"
    expect(fs.calculate_overlaping_area).to eq 4
  end 

  it 'should find claim that doesnt overlap' do
    fs = FabricSlicer.new
    fs.load_file "day3/03_sample_part1.txt"
    expect(fs.find_unoverlaped_claim).to eq "3"
  end
end