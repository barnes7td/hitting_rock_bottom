require_relative "../lib/cave_scanner"
require_relative "../lib/cave"
require_relative "../lib/scan"
# require_relative "./fake_data/fake_cave"

describe CaveScanner do
  before do
    @fake_file = File.new("./spec/fake_data/fake_cave.txt")
    @cave_scanner = CaveScanner.new(@fake_file)
  end
  
  describe "#scan_cave" do
    it "scans each row of the cave" do
      @cave_scanner.scan_cave
      expect(@cave_scanner.scan.rows).to eq(["######\n", "~    #\n", "#  # #\n", "######\n"])
    end
    
    it "sets how much water needs to be filled in" do
      @cave_scanner.scan_cave
      expect(@cave_scanner.scan.water).to eq(3)
    end
    
    it "sets how much water needs to be filled in" do
      @cave_scanner.scan_cave
      expect(@cave_scanner.scan.start_location).to eq([1, 0])
    end
  end
end
