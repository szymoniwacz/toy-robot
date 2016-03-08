require 'matrix'

class Surface
  def initialize(x=5,y=5)
    @surface = Matrix.zero(x,y)
  end

  def move_available?(x,y)
    x >= 0 && y >= 0 && @surface[x,y] == 0 ? true : false
  end

  # def visualize
  #   @surface.to_a.each do |row|
  #     print "#{row.join(" ")} \n"
  #   end
  # end
  #
  # def visualize(robot)
  #   x,y = robot.x_pose, robot.y_pose
  #   @surface.send(:[]=, x, y, "x")
  #   @surface.rotate(2).to_a.reverse.each do |row|
  #     print "#{row.join(" ")} \n"
  #   end
  # end
end
