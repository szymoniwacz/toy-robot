require 'spec_helper'

describe Simulator do
  let(:commands){"PLACE 0,0,NORTH REPORT"}
  subject {Simulator.new(commands)}

  it 'is sending parsed commands to robot' do
    raise subject.run!.inspect
  end
end
