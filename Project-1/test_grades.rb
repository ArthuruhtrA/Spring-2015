require_relative 'grades_util'
require 'test/unit'

# TetsGrades
#
# Unit test suite for testing grades_util.rb support methods:
#	compute_grade()
#	get_CSV_line()
#	numeric_to_letter()
#	sum_weights()

class TestGrades < Test::Unit::TestCase
   
  # Tests get_CSV_line to insure the entered input line
  # is correctly be parsed to an array of string words
  #
  def test_header_line
    headers = get_CSV_line("Name,ID,Grade")		  # pass in an input string
    assert_equal ["Name","ID","Grade"], headers   # return an array of header words
  end
  
  ####  YOUR ADDITIONAL UNIT TESTS START HERE  ####
  #Testing weight line
  def test_weight_line
    assert_equal ["", "", "50", "30", "20"], get_CSV_line(",,50,30,20")
  end
  #Testing grade line
  def test_grade_line
    assert_equal ["10", "20", "100", "-7"], get_CSV_line("10,20,100,-7")
  end
  #Testing numeric_to_letter()
  def test_numeric_letter
    assert_equal "A", numeric_to_letter(99)
  end
  #Testing sum_weights()
  def test_sum_weights
    assert_equal 10, sum_weights(["", "3", "", "4", "3"])
  end
  #Testing compute_grade
  def test_compute_grade
    assert_equal 10, compute_grade(5, 2)
  end
  #Testing letter grade
  def test_compute_letter
    assert_equal 62, compute_grade(1, "D-")
  end
  #Now that we know they all work, let's run some tests on edge cases
  #What happens if the input is an empty string?
  def test_empty
    assert_equal [], get_CSV_line(",,")
    #For some unknown reason, Ruby split gives us an empty array if all it's cells are empty
  end
  
end
  
