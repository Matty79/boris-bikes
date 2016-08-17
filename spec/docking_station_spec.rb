require 'docking_station'

describe DockingStation do

  it 'docks bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq([bike])
  end

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
    expect(bike).to be_working
  end

  it 'should raise error if no bikes avaliable' do
    expect{subject.release_bike}.to raise_error(RuntimeError)
  end

end
