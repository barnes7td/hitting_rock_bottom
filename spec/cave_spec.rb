require_relative "../lib/cave_scanner"
require_relative "../lib/cave"
require_relative "../lib/scan"
require_relative "../lib/element"

describe Cave do
  before do
    fake_filepath = "./spec/fake_data/fake_cave.txt"
    @cave = Cave.new(fake_filepath)
  end
  
  describe "#column" do
    it "returns an Array column" do
      scan = Scan.new
      scan.rows = ["012", "012", "012"]
      @cave.map = scan.rows
      expect(@cave.column(2)).to eq(["2", "2", "2"])
    end
    
    it "returns an column of the cave" do
      expect(@cave.column(2)).to eq(["#", " ", " ", "#"])
    end
  end
  
  describe "#amount_of_water_in_column" do
    it "returns the number of water units per column" do
      scan = Scan.new
      scan.rows = [ 
        "~~~", 
        "~# ", 
        "###"  ]
      @cave.map = scan.rows
      expect(@cave.amount_of_water_in_column(2)).to eq("~")
      expect(@cave.amount_of_water_in_column(1)).to eq(1)
      expect(@cave.amount_of_water_in_column(0)).to eq(2)
    end
  end
  
  describe "#element" do
    it "returns the element at coords given" do
      scan = Scan.new
      scan.rows = [
        "   ", 
        " # ", 
        "###"  ]
      @cave.map = scan.rows
      expect(@cave.element([0, 1])).to eq(" ")
      expect(@cave.element([1, 1])).to eq("#")
    end
  end
  
  describe "#add_water" do
    it "adds water a coords given" do
      arr = [0, 1]
      scan = Scan.new
      scan.rows = [
        "   ", 
        " # ", 
        "###"  ]
      @cave.map = scan.rows
      @cave.add_water(arr)
      expect(@cave.element(arr)).to eq("~")
    end
  end
  
  describe "#column_has_water?" do
    it "adds water a coords given" do
      scan = Scan.new
      scan.rows = [
        "~  ", 
        "~# ", 
        "###"  ]
      @cave.map = scan.rows
      expect(@cave.column_has_water?(0)).to eq(true)
      expect(@cave.column_has_water?(2)).to eq(false)
    end
  end
  
  describe "#column_is_flowing?" do
    it "returns true if air is under water" do
      scan = Scan.new
      scan.rows = [
        "~~ ", 
        "~# ", 
        "###"  ]
      @cave.map = scan.rows
      expect(@cave.column_is_flowing?(2)).to eq(false)
    end
    
    it "returns true if air is under water" do
      scan = Scan.new
      scan.rows = [
        "~~~", 
        "~# ", 
        "###"  ]
      @cave.map = scan.rows
      expect(@cave.column_is_flowing?(2)).to eq(true)
    end
    
    it "returns false if air only above water" do
      scan = Scan.new
      scan.rows = [
        "~  ", 
        "~~~", 
        "###"  ]
      @cave.map = scan.rows
      expect(@cave.column_is_flowing?(2)).to eq(false)
    end
    
    it "returns false if air is above and below water" do
      scan = Scan.new
      scan.rows = [
        "~  ", 
        "~~~", 
        "~# ", 
        "###"  ]
      @cave.map = scan.rows
      expect(@cave.column_is_flowing?(2)).to eq(true)
    end
  end
end
