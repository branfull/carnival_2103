require './lib/ride'

RSpec.describe Ride do
  describe '#initialize' do
    ride = Ride.new({name: 'Ferris Wheel', cost: 0})
    it 'exists' do
      expect(ride).to be_an_instance_of(Ride)
    end
    it 'has a name' do
      expect(ride.name).to eq('Ferris Wheel')
    end
    it 'has a cost' do
      expect(ride.cost).to eq(0)
    end
  end
end
