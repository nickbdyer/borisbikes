require 'bike_container'

class ContainerHolder; include BikeContainer; end
class Bike; end

describe BikeContainer do

  
  let(:bike) { double :bike, broken?: false, :class => Bike }
  let(:broken_bike){ double :bike, broken?: true, :class => Bike }
  let(:holder) { ContainerHolder.new }

  def fill_holder(holder)
    10.times { holder.dock(bike) }
  end

  it "should accept a bike" do
    expect{holder.dock(bike)}.to change{holder.bike_count}.by(1)
  end

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it "should not release a bike that does not exist" do
    expect{(holder.release(bike))}.to raise_error("This does not exist")
  end

  it "should not release anything that is not a bike" do
    expect{(holder.release("Horse"))}.to raise_error("This does not exist")
  end

  it "should release a default(rand) bike if no argument is given" do
    holder.dock(bike)
    expect{(holder.release)}.to change{holder.bike_count}.by(-1)
  end

  it "should not dock anything that is not a bike" do
    expect{(holder.dock("Horse"))}.to raise_error("This cannot be docked")
  end

  it "should know when it is full" do
    expect(holder).not_to be_full
    fill_holder holder
    expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_holder holder
    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
  end

  it "should provide the list of available bikes" do
    
    holder.dock(bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([bike])
  end


end

