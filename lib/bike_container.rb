module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  attr_writer :capacity

  # def capacity=(value)
  #   @capacity = value
  # end

  def bike_count
    bikes.count
  end

  def dock(bike = Bike.new)
    raise "There is no more space." if full?
    raise "This cannot be docked" if bike.class != Bike
    bikes << bike
  end

  def release(bike = bikes.sample)
    raise "This does not exist" if !bikes.include?(bike) || bike.class != Bike
    bikes.delete(bike)
  end

  def full?
    bike_count >= capacity
  end

  def available_bikes
    bikes.reject { |bike| bike.broken? }
  end

  def empty?
    bike_count == 0
  end

  def available_broken_bikes
    bikes.reject { |bike| !bike.broken? }
  end


end



