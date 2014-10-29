require 'garage'

describe 'Garage' do

  it 'should accept a broken bike' do
    bike = Bike.new
    garage = Garage.new
    expect(garage.bike_count).to eq(0)
    garage.accept_bike(bike)
    expect(garage.bike_count).to eq(1) 
  end

end
