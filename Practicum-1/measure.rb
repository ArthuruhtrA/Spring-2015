require_relative 'measure_util'

# Measurement Conversion Main Driver


# For each line of CSV input from $stdin:
#	- parse the input line into appropriate fields
#	- convert the measurements to TSP
#   - perform the computation if requested
#   - output the result as "Result = xx TSP"


$stdin.each do |line|
    
	## FILL IN ##
  line = parse_line(line)
  line[1] = line[1].to_i
    case line.length
    when 2
      puts "Result = " + convert(line[0], line[1]).to_s + "TSP"
    when 5
      line[3] = line[3].to_i
      puts "Result = " + compute(line[4].chomp, convert(line[0], line[1]),
                           convert(line[2], line[3])).to_s + "TSP"
    else
      raise ArgumentError, "Invalid amount of input"
    end
	
end

