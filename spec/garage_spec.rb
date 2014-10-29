require 'garage'

describe 'Garage' do

  it "should accept a bike" do
    bike = Bike.new
    garage = Garage.new
    expect(garage.bike_count).to eq(0)
    garage.accept_bike(bike)
    expect(garage.bike_count).to eq(1) 
  end

  it "should release a bike" do
    bike = Bike.new
    garage = Garage.new
    garage.accept_bike(bike)
    garage.release_bike(bike)
    expect(garage.bike_count).to eq(0)
  end

  it "should know when it is full" do
    bike = Bike.new
    garage = Garage.new
    expect(garage).not_to be_full
    50.times { garage.accept_bike(bike) }
    expect(garage).to be_full
  end



end
