require 'docking_station'
require 'van'

describe DockingStation do

  it_behaves_like 'BikeContainer'

  let(:station) { DockingStation.new(:capacity => 123) }
  let(:van) { Van.new }
  let(:broken_bike) {double :bike, broken?: true, :class => Bike}
  let(:broken_bike2) {double :bike, broken?: true, :class => Bike}

  it "should allow setting of default capacity on initializing" do
    expect(station.capacity).to eq(123)
  end

  it "should transfer broken bikes to van" do
    10.times{station.dock(broken_bike)}
    10.times{expect(van).to receive(:dock).with(broken_bike)}
    station.transfer_bikes_to(van, station.available_broken_bikes)
  end

  it "should raise error when transferring bikes to van if van is full" do
    11.times{station.dock(broken_bike)}
    expect{station.transfer_bikes_to(van, station.available_broken_bikes)}.to raise_error(RuntimeError)
  end

  it "should stop transferring bikes to van after error" do
    station.capacity.times {station.dock(double :bike, broken?: true, :class => Bike)}
    expect{station.transfer_bikes_to(van, station.available_broken_bikes)}.to raise_error("There is no more space.").and change{station.bike_count}.by -10
  end


end

