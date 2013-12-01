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

end 