require 'docking_station'

describe DockingStation do

  it_behaves_like 'BikeContainer'

  let(:station) { DockingStation.new(:capacity => 123) }

  it "should allow setting of default capacity on initializing" do
    expect(station.capacity).to eq(123)
  end

end

