require_relative 'spec_helper'

RSpec.describe Visitor do
  let(:visitor1)  {Visitor.new('Bruce', 54, '$10')}
  let(:visitor2)  {Visitor.new('Tucker', 36, '$5')}
  let(:visitor3)  {Visitor.new('Penny', 64, '$15')}
  
    it 'exists' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1).to be_a(Visitor)
  end

  it 'has a name, height, spending_money and starts with no preferences' do
    expect(visitor1.name).to eq("Bruce")
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
    expect(visitor1.preferences).to eq([])
  end

  it 'can add preferences' do
    visitor1.add_preference(:gentle)
    visitor1.add_preference(:water)

    expect(visitor1.preferences).to eq([:gentle, :water])
  end

  it 'checks if visitor is tall enough for ride' do
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    expect(visitor1.tall_enough?(54)).to eq(true)
    expect(visitor2.tall_enough?(54)).to eq(false)
    expect(visitor3.tall_enough?(54)).to eq(true)
    expect(visitor1.tall_enough?(64)).to eq(false)
  end
end
