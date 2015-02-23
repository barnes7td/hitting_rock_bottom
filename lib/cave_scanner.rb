class CaveScanner
  attr_reader :scan

  def initialize(file)
    @rows = file.readlines
    @scan = Scan.new
    @scan.water = read_amount_of_water
    @scan.rows = get_cave_rows
    @scan.start_location = find_start_location_of_water
    @scan
  end
  
  def read_amount_of_water
    @rows.first.to_i
  end
  
  def get_cave_rows
    @rows[2..-1].map{|row| row.chop}
  end
  
  def find_start_location_of_water
    @rows.each_with_index do |row, i|
      # return [i, /[~]/ =~ row] if row.include? "~"
      return [i, row.index(Element.water)] if row.include? Element.water
    end
  end

end
