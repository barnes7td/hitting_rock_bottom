class CaveScanner

  attr_reader :scan

  def initialize(filename)
    @filename = filename
    @scan = {}
  end

  def scan_cave
    #Collect the raw data from file
    raw_data = File.open(@filename, "r").readlines

    #Seperate raw data into usuable parts
    @scan[:water_units] = raw_data[0].to_i
    @scan[:cave] = Cave.new(raw_data[2..-1])

    #Determine the start location of the water
    #(not really needed for files given, since water in both starts in same place)
    i = 0
    @scan[:cave].each do |cross_section|
      @scan[:start_location] = [i, /[~]/ =~ cross_section] if cross_section.include? "~"
      i += 1
    end
  end

end