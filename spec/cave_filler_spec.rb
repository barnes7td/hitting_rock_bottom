require_relative "../lib/cave_filler"

describe "CaveFiller" do
  before do
    @cave = %Q[
      ######
      ~    #
      #    #
      ######]
    # puts map
    # fake_file = StringIO.new(map)
    @cave_filler = CaveFiller.new(@cave)
  end

  describe ".initialize" do
    it "sets the cave" do
      expect(@cave_filler.cave = @cave)
    end
  end
end
