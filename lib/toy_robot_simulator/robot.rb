class Robot
  attr_accessor :x_pose
  attr_accessor :y_pose
  attr_accessor :direction

  def initialize(surface)
    @surface = surface
  end

  def execute(command)
    case command
    when /^PLACE/
      place(command.match(/\d+,\d+,(NORTH|SOUTH|EAST|WEST)/))
    when "MOVE"
      move_forward
    when "RIGHT"
      turn_right
    when "LEFT"
      turn_left
    when "REPORT"
      report
    end
  end

  private

  def place(args)
    args = args[0].split(/\,/)
    x = args[0].to_i
    y = args[1].to_i
    direction = args[2]

    if @surface.move_available?(x,y)
      self.x_pose,self.y_pose,self.direction = x,y,direction
    end
  end

  def move_forward
    x, y = self.x_pose, self.y_pose
    case self.direction
    when "NORTH"
      y = y + 1
    when "SOUTH"
      y = y - 1
    when "EAST"
      x = x + 1
    when "WEST"
      x = x - 1
    end

    if x>=0 && y>=0 && @surface.move_available?(x,y)
      self.x_pose,self.y_pose = x,y
    else
      puts "Cannot move there, trying next action."
    end
  end

  def turn_right
    self.direction = case self.direction
    when "NORTH" then "EAST"
    when "SOUTH" then "WEST"
    when "EAST" then "SOUTH"
    when "WEST" then "NORTH"
    end
  end

  def turn_left
    self.direction = case self.direction
    when "NORTH" then "WEST"
    when "SOUTH" then "EAST"
    when "EAST" then "NORTH"
    when "WEST" then "SOUTH"
    end
  end

  def report
    puts [self.x_pose, self.y_pose, self.direction].join(",")
  end
end
