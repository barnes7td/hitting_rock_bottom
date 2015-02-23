require_relative "../lib/cave_scanner"
require_relative "../lib/cave"
require_relative "../lib/column"
require_relative "../lib/scan"
require_relative "../lib/element"

describe Column do
  before do
    
  end
  
  describe "#initialize" do
    it "creates and Array of elements in the column" do
      rows = [
        "~~~",
        "~# ",
        "###"  ]
      column = Column.new(2, rows)
      expect(column.elements).to eq(["~", " ", "#"])
    end
    
    it "sets the column number" do
      rows = []
      column = Column.new(2, rows)
      expect(column.number).to eq(2)
    end
  end
  
  describe "#amount_of_water_in" do
    it "returns '~' if air is under water" do
      rows = [
        "~~~",
        "~# ",
        "###"  ]
      column = Column.new(2, rows)
      expect(column.amount_of_water_in).to eq("~")
    end
    
    it "returns the number of water units per column" do
      rows = [ 
        "~~~", 
        "~# ", 
        "###"  ]
      column = Column.new(1, rows)
      expect(column.amount_of_water_in).to eq(1)
    end
    
    it "returns the number of water units per column" do
      rows = [ 
        "~~~", 
        "~# ", 
        "###"  ]
      column = Column.new(0, rows)
      expect(column.amount_of_water_in).to eq(2)
    end
  end
      
  describe "#has_water?" do
    it "returns true if water exists in column" do
      rows = [
        "~  ", 
        "~# ", 
        "###"  ]
      column = Column.new(0, rows)
      expect(column.has_water?).to eq(true)
    end
    
    it "returns false if water exists in column" do
      rows = [
        "~  ",
        "~# ",
        "###"  ]
      column = Column.new(2, rows)
      expect(column.has_water?).to eq(false)
    end
  end

  describe "#air_is_under_water?" do
    it "returns true if air is under water" do
      rows = [
        "~~ ",
        "~# ",
        "###"  ]
      column = Column.new(2, rows)
      expect(column.air_is_under_water?).to eq(false)
    end

    it "returns true if air is under water" do
      rows = [
        "~~~",
        "~# ",
        "###"  ]
      column = Column.new(2, rows)
      expect(column.air_is_under_water?).to eq(true)
    end

    it "returns false if air only above water" do
      rows = [
        "~  ",
        "~~~",
        "###"  ]
      @cave = Column.new(2, rows)
      expect(@cave.air_is_under_water?).to eq(false)
    end
                
    it "returns false if air is above and below water" do
      rows = [
        "~  ",
        "~~~",
        "~# ",
        "###"  ]
      @cave = Column.new(2, rows)
      expect(@cave.air_is_under_water?).to eq(true)
    end
  end
end
