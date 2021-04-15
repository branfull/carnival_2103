require './lib/ride'
require './lib/attendee'
require './lib/carnival'
require 'RSpec'

RSpec.describe Carnival do
  describe '#initialize' do
    jeffco_fair = Carnival.new('Jefferson County Fair')
    it 'exists' do
      expect(jeffco_fair).to be_an_instance_of(Carnival)
    end
    it 'has a name' do
      expect(jeffco_fair.name).to eq('Jefferson County Fair')
    end
    it 'has rides' do
      expect(jeffco_fair.rides).to eq([])
    end
    it 'has a list of attendees' do
      expect(jeffco_fair.attendees).to eq([])
    end
  end
  describe '#add_ride' do
    jeffco_fair = Carnival.new('Jefferson County Fair')
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    it 'adds a ride to the carnival\'s list of rides' do
      expect(jeffco_fair.rides).to eq([ferris_wheel, bumper_cars, scrambler])
    end
  end
  describe '#recommend_rides' do
    jeffco_fair = Carnival.new('Jefferson County Fair')
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    bob = Attendee.new('Bob', 20)
    sally = Attendee.new('Sally', 20)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally.add_interest('Scrambler')
    it 'returns an arra of rides an attendee has interest in' do
      expect(jeffco_fair.recommend_rides(bob)).to eq([ferris_wheel, bumper_cars])
      expect(jeffco_fair.recommend_rides(sally)).to eq([scrambler])
    end
  end
  describe '#admit' do
    jeffco_fair = Carnival.new('Jefferson County Fair')
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    bob = Attendee.new('Bob', 0)
    sally = Attendee.new('Sally', 20)
    johnny = Attendee.new('Johnny', 5)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally.add_interest('Bumper Cars')
    johnny.add_interest('Bumper Cars')
    jeffco_fair.admit(bob)
    jeffco_fair.admit(sally)
    jeffco_fair.admit(johnny)
    it 'adds an attendee to the list of Carnival attendees' do
      expect(jeffco_fair.attendees).to eq([bob, sally, johnny])
    end
  end
  describe '#attendees_by_ride_interest' do
    jeffco_fair = Carnival.new('Jefferson County Fair')
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    bob = Attendee.new('Bob', 0)
    sally = Attendee.new('Sally', 20)
    johnny = Attendee.new('Johnny', 5)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally.add_interest('Bumper Cars')
    johnny.add_interest('Bumper Cars')
    jeffco_fair.admit(bob)
    jeffco_fair.admit(sally)
    jeffco_fair.admit(johnny)
    it 'adds an attendee to the list of Carnival attendees' do
      expected = {
        ferris_wheel => [bob],
        bumper_cars => [bob, sally, johnny],
        scrambler => []
      }
      expect(jeffco_fair.attendees_by_ride_interest).to eq(expected)
    end
  end
  describe '#list_of_attendees_for_ride' do
    jeffco_fair = Carnival.new('Jefferson County Fair')
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    bob = Attendee.new('Bob', 0)
    sally = Attendee.new('Sally', 20)
    johnny = Attendee.new('Johnny', 5)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally.add_interest('Bumper Cars')
    johnny.add_interest('Bumper Cars')
    jeffco_fair.admit(bob)
    jeffco_fair.admit(sally)
    jeffco_fair.admit(johnny)
    it 'creates a list of all attendees for a given ride' do
      expect(jeffco_fair.list_of_attendees_for_ride(ferris_wheel)).to eq([bob])
      expect(jeffco_fair.list_of_attendees_for_ride(bumper_cars)).to eq([bob, sally, johnny])
      expect(jeffco_fair.list_of_attendees_for_ride(scrambler)).to eq([])
    end
  end
  describe '#lottery_ticket_contestants' do
    jeffco_fair = Carnival.new('Jefferson County Fair')
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    bob = Attendee.new('Bob', 0)
    sally = Attendee.new('Sally', 20)
    johnny = Attendee.new('Johnny', 5)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally.add_interest('Bumper Cars')
    johnny.add_interest('Bumper Cars')
    jeffco_fair.admit(bob)
    jeffco_fair.admit(sally)
    jeffco_fair.admit(johnny)
    it 'returns a list of attendees interested in a ride without enough money' do
      expected = [bob, johnny]
      expect(jeffco_fair.lottery_ticket_contestants(bumper_cars)).to eq(expected)
    end
  end
  describe '#draw_lottery_winner' do
    jeffco_fair = Carnival.new('Jefferson County Fair')
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    bob = Attendee.new('Bob', 0)
    sally = Attendee.new('Sally', 20)
    johnny = Attendee.new('Johnny', 5)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally.add_interest('Bumper Cars')
    johnny.add_interest('Bumper Cars')
    jeffco_fair.admit(bob)
    jeffco_fair.admit(sally)
    jeffco_fair.admit(johnny)
    it 'returns a list of attendees interested in a ride without enough money' do
      allow(jeffco_fair).to receive(:rand) do
        "Bob"
      end
      expected = "Bob"
      expect(jeffco_fair.draw_lottery_winner(bumper_cars)).to eq(expected)
      expect(jeffco_fair.draw_lottery_winner(ferris_wheel)).to eq(nil)
    end
  end
end
