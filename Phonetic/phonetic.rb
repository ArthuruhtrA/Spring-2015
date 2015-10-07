# Convert to/from phonetic alphabet
# YOUR NAME HERE
# Ari Sanders

  Letters = [
             ['A', 'ALPHA'],
             ['B', 'BRAVO'],
             ['C', 'CHARLIE'],
             ['D', 'DELTA'],
             ['E', 'ECHO'],
             ['F', 'FOXTROT'],
             ['G', 'GOLF'],
             ['H', 'HOTEL'],
             ['I', 'INDIA'],
             ['J', 'JULIET'],
             ['K', 'KILO'],
             ['L', 'LIMA'],
             ['M', 'MIKE'],
             ['N', 'NOVEMBER'],
             ['O', 'OSCAR'],
             ['P', 'PAPA'],
             ['Q', 'QUEBEC'],
             ['R', 'ROMEO'],
             ['S', 'SIERRA'],
             ['T', 'TANGO'],
             ['U', 'UNIFORM'],
             ['V', 'VICTOR'],
             ['W', 'WHISKEY'],
             ['X', 'XRAY'],
             ['Y', 'YANKEE'],
             ['Z', 'ZULU'],
             ]

  # Translate a word to its phonetic alphabet equivalent
  def to_phonetic(word)
    string = ""
    word.each_char {|letter|
      string += Letters[letter.upcase.ord - "A".ord][1] + " "
    }
    return string[0..-2]
  end

  # Translate a sequence of phonetic alphabet code words 
  # to their alphabetic equivalent
  def from_phonetic(str)
    string = ""
    for word in str.split(" ")
      string += word[0].upcase
    end
    return string
  end

  # If the line starts with A2P, call to_phonetic on the rest of the substring
  # If the line starts with P2A, call from_phonetic on the rest of the substring
  # Otherwise, return nothing.
  def translate(line)
    if line[0, 3].upcase == "A2P"
      return to_phonetic(line[4..-1])
    elsif line[0, 3].upcase == "P2A"
      return from_phonetic(line[4..-1])
    end
  end



# This is ruby idiom that allows us to use both unit testing and command line processing
# This gets run with ruby phonetic.rb
# Does not get run when we use unit testing, e.g. ruby phonetic_test.rb
puts __FILE__
puts $PROGRAM_NAME

if __FILE__ == $PROGRAM_NAME
  $stdin.each do |line|
    puts translate(line)
  end
end
