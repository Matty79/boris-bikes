require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    if bike=find_working_bike #returns nil if no bikes working or empty.
      @bikes.delete(bike)
    else
      raise 'There are no working bikes available'
    end
  end

  def dock(bike_object)
    if full?
      raise "Docking station is full"
    else
        @bikes << bike_object
    end
  end

  private

  def find_working_bike
    working_bike=@bikes.find(&:working?)
  end

  def full?
    @bikes.length >=  @capacity
  end
end
