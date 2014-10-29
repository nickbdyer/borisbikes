class Garage

DEFAULT_CAPACITY = 50

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def accept_bike(bike)
    @bikes << bike
  end

  def release_bike(bike)
    @bikes.delete(bike)
  end

  def full?
    bike_count == @capacity
  end


end