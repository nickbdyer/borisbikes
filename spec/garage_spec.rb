require 'garage'

describe 'Garage' do

  let(:garage) { Garage.new(capacity: 200) }
  let(:broken_bike) { double :bike, broken?: true, :class => Bike}

  it "should allow setting of default capacity on initializing" do
    expect(garage.capacity).to eq(200)
  end
  
  it "should fix a bike" do
    garage.dock(broken_bike)
    expect(broken_bike).to receive(:fix!)
    garage.repair!(garage.bikes)
  end


end
