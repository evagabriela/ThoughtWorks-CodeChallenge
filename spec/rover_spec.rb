require 'spec_helper'
require 'rover'

describe Rover do 
  let(:rover) {Rover.new(5,5,'N')}

  describe '#move_forward' do  
    it "should move position to y + 1 when facing North" do
      rover = Rover.new(1,1,'N') 
      expect { rover.move_forward }.to change { rover.pos_y }.from(1).to(2)
    end

    it "should move position to y -1 when facing South" do
      rover = Rover.new(1,1,'S')
      expect { rover.move_forward }.to change { rover.pos_y}.from(1).to(0)
    end

    it "should move position to x +1 when facing East" do
      rover = Rover.new(1,1,'E')
      expect { rover.move_forward}.to change { rover.pos_x}.from(1).to(2)
    end

    it "should move position to x -1 when facing West" do
      rover = Rover.new(1,1,'W')
      expect { rover.move_forward}.to change { rover.pos_x}.from(1).to(0)
    end
  end

  describe "#rotate_right" do
    {"N" => "E", "E" => "S", "S" => "W", "W" => "N"}.each do |initial_direction, final_direction|
      it "should change the direction from #{initial_direction} to #{final_direction}" do
        rover = Rover.new(1,1,initial_direction)
        rover.rotate_right
        rover.direction.should eq final_direction
      end
    end
  end

  describe "#rotate_left" do
    {"N" => "W", "W" => "S", "S" => "E", "E" => "N"}.each do |initial_direction, final_direction|
      it "should change the direction from #{initial_direction} to #{final_direction}" do
        rover = Rover.new(1,1,initial_direction)
        rover.rotate_left
        rover.direction.should eq final_direction
      end
    end
  end

  describe "#move" do
    it "should make a single move" do 
      rover.stub(:within_limits?).and_return(true)
      rover.should_receive(:single_move)
      rover.move("M")
    end

    it "should not move if it is out of the plateau's limits" do
      rover.stub(:within_limits?).and_return(false)
      rover.should_receive(:outside_grid)
      rover.should_not_receive(:single_move)
      rover.move("M")
    end
  end

  describe "#single_move" do
    it "should move forward" do
      rover.should_receive(:move_forward)
      rover.send(:single_move, "M")
    end

    it "should rotate left" do
      rover.should_receive(:rotate_left)
      rover.send(:single_move, "L")
    end

    it "should rotate right" do 
      rover.should_receive(:rotate_right)
      rover.send(:single_move, "R")
    end
  end

  describe "#within_limits?" do 
    let(:plateau) {double(:plateau, x:2, y:3)}
    let(:rover) { Rover.new(7,7,"S")}
    before {rover.stub(:plateau).and_return(plateau)}

    it "calls the plateau.within_limits? method" do
      plateau.should_receive(:within_limits?).with(7,7)
      rover.within_limits?
    end
  end

end