require 'garage'

describe 'Garage' do

  let(:garage) {Garage.new(capacity: 200)}

  it "should allow setting of default capacity on initializing" do
    expect(garage.capacity).to eq(200)
  end
  
  it "should fix a bike" do
    broken_bike = double :bike, broken?: true
    expect(broken_bike).to receive(:fix!)
    garage.repair!(broken_bike)
  end


end
