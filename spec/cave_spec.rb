require_relative "../lib/cave_scanner"
require_relative "../lib/cave_filler"
require_relative "../lib/cave"
require_relative "../lib/column"
require_relative "../lib/scan"
require_relative "../lib/element"

describe Cave do
  before do
    fake_filepath = File.new("./spec/fake_data/fake_cave.txt")
    @cave = Cave.new(fake_filepath)
  end
  
  describe "#element" do
    it "returns the element at coords given" do
      scan = Scan.new
      scan.rows = [
        "   ",
        " # ",
        "###"  ]
      @cave.rows = scan.rows
      expect(@cave.element([0, 1])).to eq(" ")
      expect(@cave.element([1, 1])).to eq("#")
    end
  end
  
  # describe "#add_water" do
  #   it "adds water a coords given" do
  #     scan = Scan.new
  #     scan.rows = [
  #       "   ", 
  #       " # ", 
  #       "###"  ]
  #     @cave.rows = scan.rows
  #     @cave.location = [0, 0]
  #     expect(@cave.element [0, 0]).to eq(" ")
  #     @cave.add_water
  #     expect(@cave.element [0, 0]).to eq("~")
  #   end
  # end
  
  # describe "#fill" do
  #   it "adds water a coords given" do
  #     scan = Scan.new
  #     scan.rows = [
  #       "~   ",
  #       "#   ",
  #       "####"  ]
  #     new_rows = [
  #       "~~  ",
  #       "#~~ ",
  #       "####"  ]
  #     
  #     @cave.rows = scan.rows
  #     @cave.fill
  #     expect(@cave.rows).to eq(new_rows)
  #   end
  # end
  
  describe "#fill_below" do
    it "adds water below current location" do
      scan = Scan.new
      scan.rows = [
        "~~  ",
        "#   ",
        "####"  ]
      
      @cave.rows = scan.rows
      @cave.location = [0, 1]
      expect(@cave.location).to eq([0, 1])
      @cave.fill_below
      expect(@cave.location).to eq([1, 1])
      expect(@cave.element [1, 1]).to eq("~")
    end
  end
  
  
  describe "#fill_right" do
    it "adds water to the right of the current location" do
      scan = Scan.new
      scan.rows = [
        "~~  ",
        "#~  ",
        "####"  ]
      
      @cave.rows = scan.rows
      @cave.location = [1, 1]
      expect(@cave.location).to eq([1, 1])
      @cave.fill_right
      expect(@cave.location).to eq([1, 2])
      expect(@cave.element [1, 2]).to eq("~")
    end
  end
  
  describe "#closest_location_above" do
    it "adds water to the right of the current location" do
      scan = Scan.new
      scan.rows = [
        "~~   ",
        "#~~~~",
        "#####"  ]
      
      @cave.rows = scan.rows
      @cave.location = [1, 4]
      expect(@cave.closest_location_above).to eq([0, 2])
    end
    
    it "adds water to the right of the current location" do
      scan = Scan.new
      scan.rows = [
        "~~      ",
        "#~~~~~~~",
        "########"  ]
      
      @cave.rows = scan.rows
      @cave.location = [1, 6]
      expect(@cave.closest_location_above).to eq([0, 2])
    end
  end
  
  describe "#air_is_below_location?" do
    it "adds water a coords given" do
      scan = Scan.new
      scan.rows = [
        "~  ", 
        " # ", 
        "###"  ]
      @cave.rows = scan.rows
      @cave.location = [0, 0]
      expect(@cave.air_is_below_location?).to eq(true)
    end
  end
  
  # describe "#column" do
  #   xit "returns an Array column" do
  #     scan = Scan.new
  #     scan.rows = ["012", "012", "012"]
  #     @cave = scan.rows
  #     expect(@cave.column(2)).to eq(["2", "2", "2"])
  #   end
  #   
  #   xit "returns an column of the cave" do
  #     expect(@cave.column(2)).to eq(["#", " ", " ", "#"])
  #   end
  # end
  
  # describe "#amount_of_water_in_column" do
  #   it "returns the number of water units per column" do
  #     scan = Scan.new
  #     scan.rows = [ 
  #       "~~~", 
  #       "~# ", 
  #       "###"  ]
  #     @cave.rows = scan.rows
  #     expect(@cave.amount_of_water_in_column(2)).to eq("~")
  #     expect(@cave.amount_of_water_in_column(1)).to eq(1)
  #     expect(@cave.amount_of_water_in_column(0)).to eq(2)
  #   end
  # end
  
  # describe "#column_has_water?" do
  #   it "adds water a coords given" do
  #     scan = Scan.new
  #     scan.rows = [
  #       "~  ", 
  #       "~# ", 
  #       "###"  ]
  #     @cave.rows = scan.rows
  #     expect(@cave.column_has_water?(0)).to eq(true)
  #     expect(@cave.column_has_water?(2)).to eq(false)
  #   end
  # end
  
  # describe "#column_is_flowing?" do
  #   it "returns true if air is under water" do
  #     scan = Scan.new
  #     scan.rows = [
  #       "~~ ", 
  #       "~# ", 
  #       "###"  ]
  #     @cave.rows = scan.rows
  #     expect(@cave.column_is_flowing?(2)).to eq(false)
  #   end
  #   
  #   it "returns true if air is under water" do
  #     scan = Scan.new
  #     scan.rows = [
  #       "~~~", 
  #       "~# ", 
  #       "###"  ]
  #     @cave.rows = scan.rows
  #     expect(@cave.column_is_flowing?(2)).to eq(true)
  #   end
  #   
  #   it "returns false if air only above water" do
  #     scan = Scan.new
  #     scan.rows = [
  #       "~  ", 
  #       "~~~", 
  #       "###"  ]
  #     @cave.rows = scan.rows
  #     expect(@cave.column_is_flowing?(2)).to eq(false)
  #   end
  #   
  #   it "returns false if air is above and below water" do
  #     scan = Scan.new
  #     scan.rows = [
  #       "~  ", 
  #       "~~~", 
  #       "~# ", 
  #       "###"  ]
  #     @cave.rows = scan.rows
  #     expect(@cave.column_is_flowing?(2)).to eq(true)
  #   end
  # end
end
