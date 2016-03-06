require_relative 'commands_parser'
require_relative 'surface'
require_relative 'robot'

class Simulator
  def initialize(commands = nil)
    @commands = commands
  end

  def commands_valid?
    CommandsParser.new(@commands).valid?
  end

  def run!
    parsed_commands = CommandsParser.new(@commands).parse
    abort("No commands given.") if parsed_commands.empty?
    surface = Surface.new
    robot = Robot.new(surface)

    parsed_commands.each do |command|
      robot.execute(command)
    end

    # surface.visualize(robot)
  end
end
