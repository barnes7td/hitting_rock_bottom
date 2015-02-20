class Cave
  attr_accessor :map

  def initialize(filepath)
    @scanner = CaveScanner.new(File.new(filepath))
    @map = @scanner.scan.rows
  end

  def print
    puts map
  end

  def element(arr)
    @map[arr[0]][arr[1]]
  end

  def add_water(arr)
    @map[arr[0]][arr[1]] = Element.water
  end
  
  def column(col)
    @map.map { |row| row[col] }
  end
  
  def amount_of_water_in_column(col)
    if column_is_flowing?(col)
      Element.water
    else
      amount_of_water(col)
    end
  end
  
  def column_is_flowing?(col)
    #This method checks if air is underneath water in the column
    return false unless column_has_water?(col)
    column = column(col)
    column[first_water(col)..-1].include? Element.air
  end
  
  def column_has_water?(col)
    amount_of_water(col) > 0
  end
  
  private
  
  def first_water(col)
    column(col).index(Element.water)
  end
  
  def amount_of_water(col)
    column(col).count(Element.water)
  end
end
