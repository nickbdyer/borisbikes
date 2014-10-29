require 'garage'

describe 'Garage' do

  let(:bike) {Bike.new}
  let(:garage) {Garage.new(capacity: 200)}

  it "should allow setting a default capacity on initializing" do
    expect(garage.capacity).to eq(200)
  end
  
  it "should fix a bike" do
    bike.break!
    garage.repair!(bike)
    expect(bike.broken?).to be false
  end


end
