class Person

  def initialize(bike = nil)
    @bike = bike
  end

  def has_bike?
    !@bike.nil?
  end

  def fall_down!
    @bike.break!
  end

  def lose_bike!
    @bike = nil
  end

  def rent_bike_from(station, bike)
    @bike = station.release(bike)
  end

  def return_bike_to(station)
    station.dock(@bike)
    self.lose_bike!
  end


end