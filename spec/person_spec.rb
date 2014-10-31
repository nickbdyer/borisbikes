require 'person'

describe Person do

  let(:bike)                { double :bike    }
  let(:person_without_bike) { Person.new      }  
  let(:person_with_bike)    { Person.new(bike) }

  it 'has no bike when born' do
    expect(person_without_bike).not_to have_bike
    # expect(person_without_bike.has_bike?).to be false
  end

  it 'can have a bike' do
    expect(person_with_bike).to have_bike
  end

  it 'can break a bike while having an accident' do
    expect(bike).to receive(:break!).and_return(bike)

    person_with_bike.fall_down!
  end

  it 'can lose the bike' do
    person_with_bike.lose_bike!

    expect(person_with_bike).not_to have_bike
  end

  it 'can rent a bike from a docking station' do
    old_street = double :docking_station

    expect(old_street).to receive(:release)

    person_without_bike.rent_bike_from(old_street)
  end

  it 'has that bike after renting it' do
    old_street = double :docking_station
    allow(old_street).to receive(:release).and_return(:a_bike_object)

    person_without_bike.rent_bike_from(old_street)
    expect(person_without_bike).to have_bike
  end

  it 'can return a bike to a station' do
  
  end
end