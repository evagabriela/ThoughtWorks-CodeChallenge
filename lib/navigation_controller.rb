#Developer : Eva Gabriela Zamudio 
require_relative 'rover'
require_relative 'plateau'

#Initialize a new plateau in Mars for the upper-right coordinates of the plateau
plateau = Plateau.new(5,5)
#Initialize two rovers to place on the plateau
rover1 = Rover.new(1,2,'N')  
rover2 = Rover.new(3,3,'E')
#Print out rover's initial position
rover1.initial_position 
rover2.initial_position
#Add rovers to the plateau
plateau.add_rover(rover1)
plateau.add_rover(rover2)
#Moving the rover based on input
rover1.move("LMLMLMLMM") 
rover2.move("MMRMMRMRRM")
#Ending positions
rover1.ending_position
rover2.ending_position