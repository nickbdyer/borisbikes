require 'garage'

describe Garage do

  it_behaves_like 'BikeContainer'

  let(:garage) { Garage.new(capacity: 200) }
  let(:van) {double :van}
  let(:broken_bike) { double :bike, broken?: true, :class => Bike}  
  let(:bike) { double :bike, broken?: false, :class => Bike}

  it "should allow setting of default capacity on initializing" do
    expect(garage.capacity).to eq(200)
  end
  
  it "should fix bikes" do
    garage.dock(broken_bike)
    expect(broken_bike).to receive(:fix!)
    garage.repair!(garage.bikes)
  end

  it "should transfer fixed bikes to the van" do
    10.times{garage.dock(bike)}
    10.times{expect(van).to receive(:dock).with(bike)}
    garage.transfer_bikes_to(van)
  end


end