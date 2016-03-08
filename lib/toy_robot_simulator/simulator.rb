require_relative 'surface'
require_relative 'robot'

class Simulator
  def initialize(commands = nil)
    @commands = commands
  end

  def run!
    surface = Surface.new
    robot = Robot.new(surface)

    @commands.each do |command|
      robot.execute(command)
    end

    # surface.visualize(robot)
  end
end
