require 'chronal_calibration'

describe "Chronal Calibration" do
  it 'checksums sample-part1.txt dataset to 3, from a starting frequency of 0' do
    cc = ChronalCalibration.new
    cc.load_file "sample/01_sample_part1.txt"
    expect(cc.calculate_frequency).to eq 3
  end

  it 'sample-part2a.txt should first reach 10 twice' do
    cc = ChronalCalibration.new
    cc.load_file "sample/01_sample_part2a.txt"
    expect(cc.reach_twice).to eq 10
  end    
end
