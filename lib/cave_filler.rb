class CaveFiller
  attr_reader :cave

  def initialize(cave)
    @cave = cave
  end
  
  def location
    cave.location
  end

  def fill_cave
    cave.total_amount_of_water.times do
      fill_below || fill_right || fill_up
    end
  end

  def fill_below
    if cave.air_is_below_location?
      cave.fill_below
    else 
      false
    end
  end

  def fill_right
    if cave.air_is_right_of_location?
      cave.fill_right
    else 
      false
    end
  end

  def fill_up
    cave.fill_up
  end
end
