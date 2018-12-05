require 'alchemical_reaction'

describe 'AlchemicalReaction' do
  it 'should process the material until there are no other reactions' do
    expect(AlchemicalReaction.scan('dabAcCaCBAcCcaDA')).to eq 10
  end

  it 'should process the material as before, fully processing a unit' do
    expect(AlchemicalReaction.reducer('dabAcCaCBAcCcaDA')).to eq 4
  end
end