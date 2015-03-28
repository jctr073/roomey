file = "db/neighborhoods.txt"
File.readlines(file).each do |line|
  print line.gsub(/(\d+\s)/, "")
end