require 'spec_helper'

describe Surface do
  it 'should allow placement' do
    expect(subject.move_available?(4,4)).to be true
  end

  it 'should not allow placement' do
    expect(subject.move_available?(5,5)).to be false
  end

  it 'should not allow negative coordinates' do
    expect(subject.move_available?(-1,-1)).to be false
  end
end
