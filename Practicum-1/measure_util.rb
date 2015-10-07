# Measurement Conversion Utility Methods

# Hash of measurement types to teaspoons (TSP) to be used in calculations
  CONVERT = {
             "TBL" => 3,
			 "CUP" => 48,
			 "PNT" => 96,
			 "QRT" => 192,
			 "GAL" => 768,		
			 "TSP" => 1
             }

# Given a measurement type and integer value, return the 
# equivalent number of TSP as an integer value using the CONVERT Hash.
def convert( measure_type, value )
	
	## FILL IN ##
  return CONVERT[measure_type] * value
	
end

# Return the integer result of the given operation ('+'/'-') 
# using the two integer value parameters. 
def compute( operator, value_1, value_2 )
	
	## FILL IN ##
  case operator
  when "+"
    return value_1 + value_2
  when "-"
    return value_1 - value_2
  else
    raise ArgumentError, "Invalid operator"
  end
	
end

# Given an input string in CSV format, return an array
# of element,
def parse_line( line )
	
	## FILL IN ##
  return line.split(",")
	
end

