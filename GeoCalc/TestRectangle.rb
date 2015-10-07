require_relative 'rectangle'
require_relative 'point'
require 'test/unit'

class TestRectangle < Test::Unit::TestCase
  #I'm feeling too lazy to write this now
  def test_invalid_point
    assert_raise ArgumentError do
      Rectangle.new(Point.new(2,2), Point.new(2,2))
    end
  end

  def test_invalid_horizontal
    assert_raise ArgumentError do
      Rectangle.new(Point.new(2,2), Point.new(4,2))
    end
  end

  def test_invalid_verticle
    assert_raise ArgumentError do
      Rectangle.new(Point.new(2,2), Point.new(4,2))
    end
  end
end
