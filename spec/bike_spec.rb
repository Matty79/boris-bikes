require 'bike'

describe Bike do

  it 'new bikes should work' do
    expect(subject.working?).to eq(true)
  end

  it 'should be able to be reported broken' do
    expect(subject.working?).to eq(true)
    subject.report_broken
    expect(subject.working?).to eq(false)
  end

end
