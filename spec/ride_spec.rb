require_relative 'spec_helper'

RSpec.describe Ride do
  let(:ride1) {Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
  let(:visitor1)  {Visitor.new('Bruce', 54, '$10')}
  let(:visitor2)  {Visitor.new('Tucker', 36, '$5')}
  let(:visitor3)  {Visitor.new('Penny', 64, '$15')}

  it 'exists' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    expect(ride1).to be_a(Ride)
  end

  it 'has a name, min_height, admission_fee, excitement and starts with no revenue' do
    expect(ride1.name).to eq('Carousel')
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
    expect(ride1.total_revenue).to eq(0)
  end

  it 'has a rider log that tracks who had ridden the ride and how many times' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    expect(ride1.rider_log).to eq({
      visitor1 => 2,
      visitor2 =>1
      })
  end

  xit 'reduces spending money of rider by the admission fee when they board a ride' do
    expect(visitor1.spending_money).to eq(8)
    expect(visitor1.spending_money).to eq(4)
  end
end