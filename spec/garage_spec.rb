require 'garage'

describe 'Garage' do

  let(:bike) {Bike.new}
  let(:garage) {Garage.new}

  def fill_garage(garage)
    50.times { garage.accept_bike(bike) }
  end

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
    fill_garage garage
    expect(garage).to be_full
  end

  it "should not accept a bike when it is full" do
    fill_garage garage
    expect( lambda { garage.accept_bike(bike) }).to raise_error(RuntimeError)
  end

  it "should fix a bike" do
    bike.break!
    garage.repair!(bike)
    expect(bike.broken?).to be false
  end


end
