require 'repose_record'

describe "Repose Record" do
  it 'should return the ID of the most sleepy guard multiplied by the minute he sleeps more' do
    rr = ReposeRecord.new
    rr.load_file "sample/04_sample_part1.txt"
    expect(rr.sleepy_guard_times_minute).to eq 240
  end 

  it 'should return the ID of the most sleepy minute multiplied by the guard id' do
    rr = ReposeRecord.new
    rr.load_file "sample/04_sample_part1.txt"
    expect(rr.sleepy_minute_times_guard).to eq 4455
  end 
end