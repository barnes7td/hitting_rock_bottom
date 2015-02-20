class WaterScanner
  attr_reader :column_count

  def initialize(cave)
    @cave = cave
  end

  def count_water_in_column
    #This method counts the amount of water in each column
    @column_count = []
    no_columns = (@cave.map[0].length) -1
    i = 0
    no_columns.times do
      column = @cave.column(i)
      if air_below_water? column
        @column_count << Element.water
      else
        @column_count << column.count(Element.water)
      end
      i += 1
    end
  end

  def air_below_water?(column)
    #This method checks if air is underneath water in the column
    water_found = false
    air_below = false
    column.each do |element|
      water_found = true if element == Element.water
      air_below = true if water_found && element == Element.air
    end
    air_below
  end

  def count_to_s
   @column_count.join(" ")
  end

end
