require 'garage'

describe 'Garage' do

  let(:bike) {Bike.new}
  let(:garage) {Garage.new}

  it "should accept a bike" do
    expect(garage.bike_count).to eq(0)
    garage.accept_bike(bike)
    expect(garage.bike_count).to eq(1) 
  end

  it "should release a bike" do
    garage.accept_bike(bike)
    garage.release_bike(bike)
    expect(garage.bike_count).to eq(0)
  end

  it "should know when it is full" do
    expect(garage).not_to be_full
    50.times { garage.accept_bike(bike) }
    expect(garage).to be_full
  end

  it "should not accept a bike when it is full" do
  end




end
