require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
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
  @bikes.length >= 20
end

def empty?
  @bikes.empty?
end

end
