require 'docking_station'

describe DockingStation do
  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'docks bikes' do
    bike = subject.release_bike
    expect(subject.dock(bike)).to eq([bike])
  end
  end
