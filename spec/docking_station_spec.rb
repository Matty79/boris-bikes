require 'docking_station'

describe DockingStation do

  it 'docks bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq([bike])
    expect(subject.bikes).to eq([bike])
  end

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
    expect(bike).to be_working
  end

  it 'should raise error if no bikes available' do
    expect{subject.release_bike}.to raise_error(RuntimeError)
  end

  it 'should raise error if the dock is full' do
    20.times { subject.dock(Bike.new) }
    expect{subject.dock(Bike.new)}.to raise_error(RuntimeError)
  end

end
