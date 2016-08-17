require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.empty?
      raise 'There are no bikes available'
    else
      @bikes.pop
    end
  end

  def dock(bike_object)
    if @bikes.length >= 20
      raise "Docking station is full"
    else
        @bikes << bike_object
    end
  end
end
