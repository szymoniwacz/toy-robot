class CommandsParser
  def initialize(commands)
    @commands = commands
  end

  def parse
    commands = @commands.gsub!(/\n/," ").chomp.split(/\s/)
    parsed_commands = []
    commands.each_with_index do |command, index|
      cmd = command.match(/(PLACE|MOVE|RIGHT|LEFT|REPORT)/)
      if cmd[0] == "PLACE"
        if commands[index+1] && cmd2 = commands[index+1].match(/\d+,\d+,(NORTH|SOUTH|EAST|WEST)/)
          parsed_commands << "#{cmd[0]} #{cmd2[0]}"
        end
      else
        parsed_commands << cmd[0]
      end unless cmd.nil?
    end

    parsed_commands
  end

  def commands_valid?
    check_for_place_command.nil? ? false : true
  end

  private

  def check_for_place_command
    @commands.match(/PLACE \d+,\d+,(NORTH|SOUTH|EAST|WEST)/)
  end
end
