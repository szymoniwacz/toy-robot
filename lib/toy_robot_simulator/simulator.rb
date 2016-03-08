require_relative "commands_parser"
require_relative 'surface'
require_relative 'robot'

class Simulator
  def initialize(commands = nil)
    @commands = commands
    @commands_parser = CommandsParser.new(@commands)
    surface = Surface.new
    @robot = Robot.new(surface)
  end

  def run!
    validate_commands

    puts "Entered commands: #{@commands}"

    # puts "Parsed commands: #{@commands_parser.parse}"

    @commands_parser.parse.each do |command|
      @robot.execute(command)
    end

    # surface.visualize(@robot)
  end

  private

  def validate_commands
    abort "No commands entered." if @commands.empty? || @commands == "\n"
    abort "Invalid commands." unless @parser.commands_valid?
  end
end
