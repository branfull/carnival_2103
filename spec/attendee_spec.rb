require './lib/ride'
require './lib/attendee'

RSpec.describe Attendee do
  describe '#initialize' do
    attendee = Attendee.new('Bob', 20)
    it 'exists' do
      expect(attendee).to be_an_instance_of(Attendee)
    end
    it 'has a name' do
      expect(attendee.name).to eq('Bob')
    end
    it 'has spending money' do
      expect(attendee.spending_money).to eq(20)
    end
    it 'has interests' do
      expect(attendee.interests).to eq([])
    end
  end
end
