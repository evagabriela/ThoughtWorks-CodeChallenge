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
end