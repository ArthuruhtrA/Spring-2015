require_relative 'grades_util'

# grades.rb Ruby Script
#
# Read the first row (column names) and second row (grade weights).
# If the weights don't sum up to 100, print an error message and exit.
# Otherwise print the column headers with their weights (empty weights simply don't print)
#
# For each student line, print the header and column for each field in the line.
# The field could be identifying information (if the weight is blank) or numeric (if the
# weight is non-negative). Grades can be numeric or letter (with optional +/-)
# Also prints final weighted numeric grade and letter grade.
#
# At end, prints a summary showing the number students for each letter grade and
# the class GPA.


# Create the hash for counting the number of occurrences of each letter grade.

lettercount = Hash.new(0)   # default count is 0.

# Use get_CSV_line() to get the header and weight lines.
# Each line should be "chomped" to eliminate the end of line character(s).
# Create arrays for the headers and weights by splitting on commas.

### YOUR CODE HERE ###
headers = (get_CSV_line(gets))
values = (get_CSV_line(gets))

# For each header, print the header and, if present, its weight.

### YOUR CODE HERE ###
weights = Array.new#Setup for level 3
headers.each_index do |i|
  puts(headers[i] + " #{values[i]}")
  weights.push(values[i])#setup for level 3
end

# Use sum_weights() to check if the weights do not sum to 100, output the error message:
# "Weights add up to #{sum}, not 100" - where sum is the sum of input weights

### YOUR CODE HERE ###
total = sum_weights(weights)
if total != 100
  puts "Weights add up to #{total}, not 100"
end

# Get each of the remaining lines, representing grade information for an individual student.
# Print the header for each column and whatever is in that column on the student grade line.
# Compute contribution of each weighted field to the overall grade using compute_grade(),
# remember to skip fields that do not have weights associated with them.
# Convert the numeric grade to a letter grade using numeric_to_letter().
# Output the final numeric and letter grade for that student and update the
# lettercount hash that is keeping track of the number of occurrences of each letter grade
# for the class.

while line = gets
  fields = get_CSV_line(line)

  ### YOUR CODE HERE ###
  grade = 0#level 4
  headers.each_index do |i|
    puts(headers[i] + ": " + fields[i])
     #print(fields[i])#
    if fields[i].to_f == 0.0#level 5
      fields[i] = LETTER_TO_NUMERIC[fields[i].upcase]
    end
     #puts(fields[i])#
    grade += compute_grade(values[i].to_f, fields[i].to_f)#level 4
     #puts(values[i].to_s + " " + grade.to_s + " " + fields[i].to_s)#
  end
  grade /= 100
  grade = grade.to_i
  letter = numeric_to_letter(grade)
  puts("Final Numeric Grade = " + grade.to_s + " Letter = " + letter)
  lettercount[letter] += 1#level 6

end

# Now print the summary information - the number of students at each letter grade level
# and the class GPA using print_summary().

  ### YOUR CODE HERE ###
  puts("A" + " = " + lettercount["A"].to_s)
  puts("B" + " = " + lettercount["B"].to_s)
  puts("C" + " = " + lettercount["C"].to_s)
  puts("D" + " = " + lettercount["D"].to_s)
  puts("F" + " = " + lettercount["F"].to_s)
  puts("Class GPA = " + (4 * lettercount["A"] + 3 * lettercount["B"] + 2 * lettercount["C"] + lettercount["D"]).to_s)
