require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    if empty?
      raise 'There are no bikes available'
    else
      @bikes.pop
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

def full?
  @bikes.length >= DEFAULT_CAPACITY
end

def empty?
  @bikes.empty?
end

end
