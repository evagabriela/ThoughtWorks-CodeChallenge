# Developer : Eva Gabriela Zamudio 
require_relative 'plateau'

class Rover
  attr_accessor :plateau
  attr_reader :pos_x, :pos_y, :direction

  def initialize(pos_x,pos_y,direction)
    @pos_x = pos_x 
    @pos_y = pos_y
    @direction = direction
  end

  def to_s
    "#{@pos_x} #{@pos_y} #{@direction}"
  end

  def move(position)
    position.split('').each do |m|
      unless within_limits?
        outside_grid
        break
      end
      single_move(m)
    end
  end

  def single_move(move)
    case 
    when move == "L"
      rotate_left
    when move == "R"
      rotate_right
    when move == "M"
      move_forward
    end
  end

  def rotate_left
    @direction = case @direction
    when 'N' then 'W'
    when 'E' then 'N'
    when 'S' then 'E'
    when 'W' then 'S'
    end  
  end

  def rotate_right 
    @direction = case @direction
    when 'N' then 'E'
    when 'E' then 'S'
    when 'S' then 'W'
    when 'W' then 'N'
    end
  end

  def move_forward
    case @direction
    when 'N' then @pos_y += 1
    when 'S' then @pos_y -= 1
    when 'E' then @pos_x += 1
    when 'W' then @pos_x -= 1
    end 
  end

  def initial_position
    p "The rover's starting_position is: #{self}"
  end

  def ending_position
    p "The rover's ending position is: #{self}"
  end

  def  within_limits?
    plateau.within_limits?(@pos_x,@pos_y)
  end

  def outside_grid(inst)
    p "Looks like the rover is trying to go outside of the grid!"
  end
end