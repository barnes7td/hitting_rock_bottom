require "./lib/cave"
require "./lib/scan"
require "./lib/cave_scanner"
require "./lib/cave_filler"
require "./lib/water_scanner"

#MAIN (run program)

cave = Cave.new File.new("./data/complex_cave.txt")
cave.fill
#or
cave.fill_with_display
cave.count_water_by_column
cave.create_output_file

# output_filename = "./data/complex_out.txt"
# File.new(output_filename, "w") unless File.directory? output_filename
# File.open(output_filename, "w") do |f|
#   f.puts ws.count_to_s
# end
