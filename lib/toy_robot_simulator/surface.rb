require 'matrix'

class Surface
  def initialize(x=5,y=5)
    @surface = Matrix.zero(x,y)
  end

  def move_available?(x,y)
    x && y && x >= 0 && y >= 0 && @surface[x,y] == 0 ? true : false
  end
end
