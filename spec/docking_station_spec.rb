require 'docking_station'
require 'van'

describe DockingStation do

  it_behaves_like 'BikeContainer'

  let(:station) { DockingStation.new(:capacity => 123) }
  let(:van) { Van.new }
  # let(:van) { Van.new }
  let(:broken_bike) {double :bike, broken?: true, :class => Bike}

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

  xit "should stop transferring bikes to van after error" do
    11.times{station.dock(broken_bike)}
    expect{station.transfer_bikes_to(van, station.available_broken_bikes)}.to raise_error(RuntimeError).and change{van.bike_count}.by 10
    # expect{station.transfer_bikes_to(van, station.available_broken_bikes)}.
    expect(station.bike_count).to eq 1
  end


end

