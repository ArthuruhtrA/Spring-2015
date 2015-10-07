require_relative 'measure_util' 
require 'test/unit'          

class MeasureTest < Test::Unit::TestCase 

  ### Add your tests here ###
  def test_convert_1
    assert_equal 48, convert("CUP", 1)
  end

  def test_convert_0
    assert_equal 0, convert("QRT", 0)
  end

  def test_convert_more
    assert_equal 9, convert("TBL", 3)
  end


  def test_compute_add
    assert_equal 5, compute("+", 2, 3)
  end
  def test_compute_subtract
    assert_equal 14, compute("-", 21, 7)
  end
  def test_compute_error
    assert_raise ArgumentError do
      compute("?", 3, 202)
    end
  end


  def test_parse_good
    assert_equal ["CUP", "4", "QRT", "1", "+"], parse_line("CUP,4,QRT,1,+")
  end
  def test_parse_bad
    assert_equal ["This is invalid input"], parse_line("This is invalid input")
  end
  
end
