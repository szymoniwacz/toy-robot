require_relative "commands_parser"
require_relative 'surface'
require_relative 'robot'

class Simulator
  def initialize(commands = nil)
    @commands = commands
    @commands_parser = CommandsParser.new(@commands)
  end

  def run!
    if @commands.empty? || @commands == "\n"
      puts "No commands entered."
    elsif !@commands_parser.commands_valid?
      puts "Invalid commands."
    else
      @robot = Robot.new(Surface.new)
      puts "Entered commands: #{@commands}"
      puts "Parsed commands: #{@commands_parser.parse}"
      @commands_parser.parse.each do |command|
        @robot.execute(command)
      end
    end
  end
end
