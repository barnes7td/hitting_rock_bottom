require "./lib/cave"
require "./lib/cave_scanner"
require "./lib/cave_filler"
require "./lib/water_scanner"

#MAIN (run program)

cs = CaveScanner.new "./data/complex_cave.txt"
cs.scan_cave

cf = CaveFiller.new cs.scan
cf.fill_cave

ws = WaterScanner.new cf.cave
ws.count_water_in_column

output_filename = "./data/complex_out.txt"
File.new(output_filename, "w") unless File.directory? output_filename
File.open(output_filename, "w") do |f|
  f.puts ws.count_to_s
end


