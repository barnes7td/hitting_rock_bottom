require "./cave_filler"

describe "CaveFiller" do
  before do
    map = %Q[3

      ######
      ~    #
      #    #
      ######]
    fake_file = StringIO.new(map)
    @cave_filler = CaveFiller.new(100)
  end

  describe "should have all methods including" do
    it "fill_cave"   do @cave_filler.should respond_to :fill_cave  end
    it "fill_down"   do @cave_filler.should respond_to :fill_down  end
    it "fill_right"  do @cave_filler.should respond_to :fill_right end
    it "fill_up"     do @cave_filler.should respond_to :fill_cave  end
  end
end