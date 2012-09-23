class Cave

  attr_reader :elements, :map

  def initialize(map)
    @elements = {"#" => :dirt, "~" => :water, " " => :air}
    @map = map
  end

  def each
    #adds each method to Cave class
    @map.each { |element| yield element }
  end

  def print
    #print map to console (for debugging)
    puts @map
  end

  def element(arr)
    #determine which element is located at given coordinates
    @elements[@map[arr[0]][arr[1]]]
  end

  def add_water(arr)
    #add water at given coordinates
    @map[arr[0]][arr[1]] = "~"
  end

  def column(no)
    #returns a string of column elements (top down) at column number
    arr = []
    @map.each { |row| arr << row[no] }
    arr
  end

end