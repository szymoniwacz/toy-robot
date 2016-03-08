require 'spec_helper'

describe CommandsParser do
  describe 'validating' do
    let(:valid_commands){"PLACE 0,0,NORTH MOVE RIGHT MOVE MOVE RIGHT MOVE REPORT"}
    let(:invalid_commands){"MOVE RIGHT MOVE PLACE RIGHT MOVE REPORT"}

    it 'should be correct' do
      expect(CommandsParser.new(valid_commands).commands_valid?).to be true
    end

    it 'should be incorrect' do
      expect(CommandsParser.new(invalid_commands).commands_valid?).to be false
    end
  end

  describe 'parsing' do
    let(:commands){"MOVE PLACE 0,0,NORTH CAR PLACE LEFT WHITE MOVE REPORT"}
    let(:parsed_commands){["MOVE", "PLACE 0,0,NORTH", "LEFT", "MOVE", "REPORT"]}

    it 'should parse correctly' do
      expect(CommandsParser.new(commands).parse).to eq parsed_commands
    end
  end
end
