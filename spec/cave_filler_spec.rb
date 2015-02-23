require_relative "../lib/cave_scanner"
require_relative "../lib/cave_filler"
require_relative "../lib/cave"
# require_relative "../lib/column"
require_relative "../lib/scan"
require_relative "../lib/element"

describe "CaveFiller" do
  before do
    @scan = Scan.new
    @scan.rows = [
      "   ",
      " # ",
      "###"  ]
    @scan.water = 2
    
    @cave = Cave.new(StringIO.new)
    @cave.location = [0, 0]
    @cave.rows = @scan.rows
  end

  describe ".initialize" do
    it "sets the cave" do
      cave_filler = CaveFiller.new(@scan, @cave)
      expect(cave_filler.water_units).to eq(2)
    end
    
    it "sets the cave" do
      cave_filler = CaveFiller.new(@scan, @cave)
      expect(cave_filler.location).to eq([0, 0])
    end
    
    it "sets the cave" do
      cave_filler = CaveFiller.new(@scan, @cave)
      expect(cave_filler.cave.rows).to eq(@scan.rows)
    end
  end

  describe "#fill_below" do
    it "sets the cave" do
      cave_filler = CaveFiller.new(@scan, @cave)
      cave_filler.fill_below
      expect(cave_filler.location).to eq([1, 0])
    end
    
    it "sets the cave" do
      cave_filler = CaveFiller.new(@scan, @cave)
      expect(cave_filler.fill_below).to eq(true)
    end
  end
end
