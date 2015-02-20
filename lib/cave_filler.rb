class CaveFiller

  attr_reader :cave

  def initialize(scan)
    @water_units = scan.water
    @current_location = scan.start_location
    @cave = scan.cave
  end

  def fill_cave
    #Fill cave with precedence with the amount of water given.
    @water_units.times do
      fill_down || fill_right || fill_up
    end
  end

  def fill_down
    #Finds location below the current location and fills it with water if empty
    below = [@current_location[0] + 1, @current_location[1]]
    if @cave.element(below) == Element.air
      @current_location = below
      @cave.add_water(below)
    end
  end

  def fill_right
    #Finds location right of the current location and fills it with water if empty
    next_to = [@current_location[0], @current_location[1] + 1]
    if @cave.element(next_to) == Element.air
      @current_location = next_to
      @cave.add_water(next_to)
    end
  end

  def fill_up
    #Finds farthest left location above the current location's level and fills it with water
    above = [@current_location[0] - 1, /[ ]/ =~ (@cave.map[@current_location[0] - 1]) ]
    @current_location = above
    @cave.add_water(above)
  end

end
