require File.dirname(__FILE__) + '/../lib/ruby_ranges'
require 'test/unit'

class RubyRangesTest < Test::Unit::TestCase

  def test_subtracting_inclusive_ranges
    output = (1..9) - (5..7)
    assert_equal ArrayOfRanges.new(1..4, 8..9), output
  end

  def test_adding_smaller_range
    output = (1..9) + (4..7)
    assert_equal (1..9), output
  end

  def test_adding_larger_range
    output = (4..7) + (1..9)
    assert_equal (1..9), output
  end

  def test_adding_an_upward_inclusive_range
    assert_equal (1..12), (1..9) + (5..12)
  end

  def test_adding_a_downward_inclusive_range
    assert_equal (-5..9), (1..9) + (-5..5)
  end

  def test_adding_exclusive_ranges
    output = (1..4) + (8..9)
    assert_equal ArrayOfRanges.new((1..4), (8..9)), output
  end

  def test_subtract_exclusive_ranges
    output = (1..9) + (11..12)
    assert_equal ArrayOfRanges.new(1..9), output
  end

  def test_subtracting_larger_range
    assert_equal nil, (1..9) - (-1..10)
  end
end