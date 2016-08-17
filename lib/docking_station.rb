require_relative 'bike'

class DockingStation
  attr_reader :bikes
def initialize
  @bikes = []
end
  def release_bike
    Bike.new
  end
  def dock(bike_object)
@bikes << bike_object
  end
end
