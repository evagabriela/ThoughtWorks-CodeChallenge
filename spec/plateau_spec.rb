require 'spec_helper'
require 'plateau'


describe Plateau do 
  let(:plateau) {Plateau.new(5,5)}

  describe "#add_rover" do
    let(:rover) {double(:rover, pos_x: 1, pos_y: 2, direction: 'N').as_null_object}
    it "should add a rover to a plateau" do
      plateau.add_rover(rover)
      plateau.rovers.should include(rover)
    end
  end


  describe "#within_limits" do
    it "should return true if an object is within limits" do
      expect(plateau.within_limits(1,2)).to be_true  
    end
    it "should return false if an object is withing limits" do
      expect(plateau.within_limits(7,7)).to be_false
      expect(plateau.within_limits(7,2)).to be_false
      expect(plateau.within_limits(3,7)).to be_false
    end
  end
end