class Cave
  attr_accessor :rows, :column, :location, :total_amount_of_water, :locator

  def initialize(file = StringIO.new)
    scanner = CaveScanner.new(file)
    scan = scanner.scan
    @rows = scan.rows
    @location = Location.new(self, scan.start_location)
    # @locator = Location.new(self)
    @total_amount_of_water = scan.water
  end

  def to_s
    puts rows
  end

  def element(arr)
    rows[arr[0]][arr[1]]
  end

  def add_water
    @rows[location.first][location.last] = Element.water
    true
  end
  
  def set_column(number)
    @column = Column.new(number, @rows)
  end
  
  def air_is_below_location?
    element(location.below) == Element.air
  end
  
  def air_is_right_of_location?
    element(location.right_of) == Element.air
  end
  
  def fill_below
    @location.current = location.below
    add_water
  end
  
  def fill_right
    @location.current = location.right_of
    add_water
  end
  
  def fill_up
    @location.current = closest_location_above
    add_water
  end
  
  def closest_location_above
    [location.row_above, rows[location.row_above].index(Element.air) ]
  end
  
  def fill
    cave_filler = CaveFiller.new(self)
    cave_filler.fill_cave
    rows
  end
  
  def count_water_by_column
    count = []
    no_of_columns.times do |num|
      set_column(num)
      count << column.amount_of_water_in
    end
    count.join(" ")
  end
  
  def no_of_columns
    rows.first.size
  end
  
  def create_output_file
    
  end
end
