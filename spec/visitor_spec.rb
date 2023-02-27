require './lib/visitor'

RSpec.describe Visitor do
  let(:visitor1)  {Visitor.new('Bruce', 54, '$10')}
  
    it 'exists' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1).to be_a(Visitor)
  end
end
