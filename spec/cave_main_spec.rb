require_relative "../lib/cave_scanner"
require_relative "../lib/cave"
require_relative "../lib/column"
require_relative "../lib/scan"
require_relative "../lib/element"
require_relative "../cave_main"

describe CaveMain do
  describe ".run" do
    it "runs the program" do
      count = CaveMain.run(File.new("./data/simple_cave.txt"))
      expect(count).to eq("1 2 2 4 4 4 4 6 6 6 1 1 1 1 ~ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0")
    end
  end
end
