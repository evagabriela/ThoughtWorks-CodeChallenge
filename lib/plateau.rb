# Developer : Eva Gabriela Zamudio 

class Plateau
  attr_reader :rovers, :x_limit, :y_limit
  
  def initialize(x,y)
    @x_limit = x
    @y_limit = y
    @rovers = []
  end

  def add_rover(rover)
    @rovers << rover
    rover.plateau = self
  end

  def within_limits(pos_a, pos_b)
    pos_a <= @x_limit && pos_b <= @y_limit
  end

end 