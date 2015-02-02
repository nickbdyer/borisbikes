require 'spec_helper'
require 'van'

describe Van do

  it_behaves_like 'BikeContainer'

  let(:van){ Van.new(capacity: 20) }
  let(:garage) {double :Garage}
  let(:broken_bike) {double :bike, broken?: true, :class => Bike}


  it "should allow setting of default capacity when initializing" do
    expect(van.capacity).to eq(20)
  end

  it "should transfer bikes to Garage" do
    10.times{van.dock(broken_bike)}
    10.times{expect(garage).to receive(:dock).with(broken_bike)}
    van.transfer_bikes_to(garage, van.available_broken_bikes)
  end


end
