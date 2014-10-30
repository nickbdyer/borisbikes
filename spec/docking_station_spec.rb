require 'docking_station'

describe DockingStation do

  it_behaves_like 'BikeContainer'

  let(:station) { DockingStation.new(:capacity => 123) }
  let(:van) {double :van}
  let(:broken_bike) {double :bike, broken?: true, :class => Bike}

  it "should allow setting of default capacity on initializing" do
    expect(station.capacity).to eq(123)
  end

  it "should transfer broken bikes to van" do
    10.times{station.dock(broken_bike)}
    10.times{expect(van).to receive(:dock).with(broken_bike)}
    station.transfer_bikes_to(van, station.available_broken_bikes)
  end

end

