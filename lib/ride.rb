class Ride
  attr_reader :name,
              :cost
  def initialize(ride_information)
    @name = ride_information[:name]
    @cost = ride_information[:cost]
  end
end
