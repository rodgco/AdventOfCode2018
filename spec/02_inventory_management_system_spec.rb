require 'inventory_management_system'

describe "Box" do
  it 'returns 0 duples & triples for the box with ID "abcdef"' do
    box = Box.new("abcdef")
    expect(box.has_duples?).to eq false
    expect(box.has_triples?).to eq false
  end

  it 'returns 1 duples & 0 triples for the box with ID "aabcde"' do
    box = Box.new("aabcde")
    expect(box.has_duples?).to eq true
    expect(box.has_triples?).to eq false
  end

  it 'returns 1 duples & 1 triples for the box with ID "ababcb"' do
    box = Box.new("ababcb")
    expect(box.has_duples?).to eq true
    expect(box.has_triples?).to eq true
  end

  it 'returns 0 duples & 1 triples for the box with ID "abebcb"' do
    box = Box.new("abebcb")
    expect(box.has_duples?).to eq false
    expect(box.has_triples?).to eq true
  end
end

describe "InventoryManagementSystem" do
  it 'returns 12 for the sample' do
    ims = InventoryManagementSystem.new()
    ims.load_file('day2/sample-part1.txt')
    expect(ims.checksum).to eq 12
  end
end

describe "IMS - Part2" do
  it 'returns "fgij" for the sample' do
    ims2 = InventoryManagementSystem.new()
    ims2.load_file('day2/sample-part2.txt')
    expect(ims2.find_common_letters_of_correct_boxes).to eq "fgij"
  end
end
