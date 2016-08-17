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
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
    expect{subject.dock(Bike.new)}.to raise_error(RuntimeError)
  end

  it 'can be initialized with custom capacity' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq(30)
  end

  it 'will default to 20 capacity' do
    station = DockingStation.new
    expect(station.capacity).to eq(20)
  end

  it 'should dock broken bikes but not release them'
    bike=Bike.new
    bike.report_broken
    expect(subject.dock(bike)).to eq([bike])
    expect{subject.release_bike}.to raise_error(RuntimeError)
    bike2 = Bike.new
    subject.dock(bike2)
    expect(subject.release_bike).to eq(bike2)
  end

end
