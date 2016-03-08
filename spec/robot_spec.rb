require 'spec_helper'

describe Robot do
  let(:surface){Surface.new}
  subject {Robot.new(surface)}

  describe 'moving' do
    it 'should be placed on surface' do
      expect(subject.execute("PLACE 0,0,NORTH")).not_to be_nil
    end

    it 'should move forward' do
      subject.execute("PLACE 0,0,NORTH")
      expect(subject.execute("MOVE")).not_to be_nil
    end

    it 'should not move forward' do
      subject.execute("PLACE 0,0,SOUTH")
      expect(subject.execute("MOVE")).to be_nil
    end
  end

  describe 'faced north' do
    before do
      subject.direction = "NORTH"
    end

    it 'should turn right' do
      subject.execute("RIGHT")
      expect(subject.direction).to eq "EAST"
    end

    it 'should turn left' do
      subject.execute("LEFT")
      expect(subject.direction).to eq "WEST"
    end
  end

  describe 'faced south' do
    before do
      subject.direction = "SOUTH"
    end

    it 'should turn right' do
      subject.execute("RIGHT")
      expect(subject.direction).to eq "WEST"
    end

    it 'should turn left' do
      subject.execute("LEFT")
      expect(subject.direction).to eq "EAST"
    end
  end

  describe 'faced east' do
    before do
      subject.direction = "EAST"
    end

    it 'should turn right' do
      subject.execute("RIGHT")
      expect(subject.direction).to eq "SOUTH"
    end

    it 'should turn left' do
      subject.execute("LEFT")
      expect(subject.direction).to eq "NORTH"
    end
  end

  describe 'faced west' do
    before do
      subject.direction = "WEST"
    end

    it 'should turn right' do
      subject.execute("RIGHT")
      expect(subject.direction).to eq "NORTH"
    end

    it 'should turn left' do
      subject.execute("LEFT")
      expect(subject.direction).to eq "SOUTH"
    end
  end

  describe 'reporting' do
    it 'should report its current position' do
      subject.execute("PLACE 2,2,NORTH")
      expect(subject.execute("REPORT")).to eq "2,2,NORTH"
    end
  end
end
