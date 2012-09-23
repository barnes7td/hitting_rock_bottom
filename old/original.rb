class CaveScanner

  attr_reader :scan

  def initialize(filename)
    @filename = filename
    @scan = {}
    @water = '~'
  end

  def scan_cave
    #Collect the raw data from file
    raw_data = File.open(@filename, "r").readlines

    #Seperate raw data into usuable parts
    @scan[:water_units] = raw_data[0].to_i
    @scan[:cave] = raw_data[2..-1]

    #Determine the start location of the water
    #(not really needed for files given, since water in both starts in same place)
    i = 0
    @scan[:cave].each do |cross_section|
      @scan[:start_location] = [i, /[~]/ =~ cross_section] if cross_section.include? "~"
      i += 1
    end
  end

end


class CaveFiller

  attr_reader :cave

  def initialize(scan)
    @water_units = scan[:water_units]
    @current_location = scan[:start_location]
    @cave = scan[:cave]
    @water = "~"
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
    if get_condition(below) == " "
      @current_location = below
      @cave[below[0]][below[1]] = @water
    end
  end

  def fill_right
    #Finds location right of the current location and fills it with water if empty
    next_to = [@current_location[0], @current_location[1] + 1]
    if get_condition(next_to) == " "
      @current_location = next_to
      @cave[next_to[0]][next_to[1]] = @water
    end
  end

  def fill_up
    #Finds farthest left location above the current location's level and fills it with water
    above = [@current_location[0] - 1, /[ ]/ =~ (@cave[@current_location[0] - 1]) ]
    if get_condition(above) == " "
      @current_location = above
      @cave[above[0]][above[1]] = @water
    end
  end

  def get_condition(location)
    #Determines whether has air, water, or dirt
    @cave[location[0]][location[1]]
  end

end


class WaterScanner
  attr_reader :columns

  def initialize(cave)
    @cave = cave
    @water = '~'
    @air = ' '
  end

  def scan_water_by_column
    #This method scans each column (top down) and count the number of water units
    #This method also checks if air is underneath water in the column
    @columns = []
    no_columns = @cave[0].length
    no_rows = @cave.length
    ci = 0
    (no_columns - 1).times do
      ri = 0
      count = 0
      water_found = false
      still_counting = true
      no_rows.times do 
        if water_found && @cave[ri][ci] == @air
          count = "~"
          still_counting = false
        elsif @cave[ri][ci] == @water && still_counting
          count += 1
          water_found = true
        end
        ri += 1
      end
      @columns << count
      ci += 1
    end
  end

  def print_output(filename)
    File.new(filename, "w") unless File.directory? filename
    File.open(filename, "w") do |f|
      f.puts @columns.join(" ")
    end
  end

end

class Cave

  def initialize

  end


end

cs = CaveScanner.new("./data/complex_cave.txt")
cs.scan_cave
# p cs.scan[:water_units]
puts cs.scan[:cave]
# p cs.scan[:start_location]

gets
puts

cf = CaveFiller.new(cs.scan)
cf.fill_cave
puts cf.cave

ws = WaterScanner.new(cf.cave)
ws.scan_water_by_column
# puts cr.columns.join(" ")
ws.print_output("./data/complex_out.txt")


