require "./lib/cave"
require "./lib/scan"
require "./lib/element"
require "./lib/column"
require "./lib/cave_scanner"
require "./lib/cave_filler"
require "./lib/cave/locator"

#MAIN (run program)

class CaveMain
  def self.run(file = File.new("./data/simple_cave.txt"))
    cave = Cave.new file
    rows = cave.fill
    # puts rows
    #or
    # cave.fill_with_display
    ct = cave.count_water_by_column
    cave.create_output_file
    ct
  end
end

CaveMain.run

# output_filename = "./data/complex_out.txt"
# File.new(output_filename, "w") unless File.directory? output_filename
# File.open(output_filename, "w") do |f|
#   f.puts ws.count_to_s
# end

# scan / map / cave
# 
# cave
# cave_filler < cave
# water_scanner < cave
# cave_scanner < cave


######


# cave
#   -> scanner -> 
#              -> intitial
#   -> filler
#   -> scan
#   -> element
