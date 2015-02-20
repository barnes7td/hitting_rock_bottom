class CaveScanner

  attr_reader :scan

  def initialize(file)
    @file = file
    @scan = Scan.new
    scan_cave
  end

  def scan_cave
    #Collect the raw data from file
    scanned_rows = @file.readlines

    #Seperate raw data into usuable parts
    @scan.water = scanned_rows.first.to_i
    @scan.rows = scanned_rows[2..-1].to_a

    #Determine the start location of the water
    #(not really needed for files given, since water in both starts in same place)
    @scan.rows.each_with_index do |cross_section, i|
      @scan.start_location = [i, /[~]/ =~ cross_section] if cross_section.include? "~"
    end
  end

end
