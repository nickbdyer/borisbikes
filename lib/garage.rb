require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
    @capacity = options.fetch(:capacity, capacity)
  end

  def repair!(bike)
    bike.fix!
  end


end