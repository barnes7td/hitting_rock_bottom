class Location
  attr_accessor :cave, :row, :col
  
  def initialize(cave, start_location)
    @cave = cave
    @row, @col = start_location
  end
  
  def air_is_below_location?
    cave.element(below) == Element.air
  end
  
  def below
    [row + 1, col]
  end
  
  def right_of
    [row, col + 1]
  end
  
  def row_above
    row - 1
  end
  
  def closest_above
    [row_above, cave.rows[row_above].index(Element.air) ]
  end
end
