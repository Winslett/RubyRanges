require File.dirname(__FILE__) + '/../lib/ruby_ranges'
require 'test/unit'

class RubyRanges::ArrayOfRangesTest < Test::Unit::TestCase

  include RubyRanges

  def test_adding_mutually_exclusive_arrays_of_ranges
    output = ArrayOfRanges.new((1..4), (18..20)) + ArrayOfRanges.new((12..15), (6..9))
    assert_equal ArrayOfRanges.new((1..4), (6..9), (12..15), (18..20)), output
  end

  def test_adding_spanning_arrays_of_ranges
    output = ArrayOfRanges.new((1..10), (15..25)) + ArrayOfRanges.new((8..23), (25..28))
    assert_equal 1..28, output
  end

  def test_adding_downward_inclusive_arrays_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) + ArrayOfRanges.new(5..13, 18..22)
    assert_equal ArrayOfRanges.new(5..15, 18..25), output
  end

  def test_adding_upward_inclusive_exclusive_arrays_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) + ArrayOfRanges.new(13..18, 23..28)
    assert_equal ArrayOfRanges.new(10..18, 20..28), output
  end

  def test_adding_mutually_exclusive_range_to_arrays_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) + (28..30)
    assert_equal ArrayOfRanges.new(10..15, 20..25, 28..30), output
  end

  def test_adding_spanning_range_to_arrays_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) + (13..22)
    assert_equal 10..25, output
  end

  def test_adding_downward_inclusive_range_to_arrays_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) + (18..22)
    assert_equal ArrayOfRanges.new(10..15, 18..25), output
  end

  def test_adding_upward_inclusive_range_to_arrays_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) + (13..18)
    assert_equal ArrayOfRanges.new(10..18, 20..25), output
  end

  def test_subtracting_mutually_exclusive_array_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) - ArrayOfRanges.new(17..19, 27..30)
    assert_equal ArrayOfRanges.new(10..15, 20..25), output
  end

  def test_subtracting_spanning_array_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) - ArrayOfRanges.new(13..22, 24..30)
    assert_equal ArrayOfRanges.new(10..13, 22..24), output
  end

  def test_subtracting_downward_inclusive_array_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) - ArrayOfRanges.new(8..12, 18..22)
    assert_equal ArrayOfRanges.new(12..15, 22..25), output
  end

  def test_subtracting_upward_inclusive_array_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) - ArrayOfRanges.new(13..18, 24..30)
    assert_equal ArrayOfRanges.new(10..13, 20..24), output
  end

  def test_subtracting_mutually_inclusive_range_from_array_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) - (17..19)
    assert_equal ArrayOfRanges.new(10..15, 20..25), output
  end

  def test_subtracting_spanning_range_from_array_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) - (13..22)
    assert_equal ArrayOfRanges.new(10..13, 22..25), output
  end

  def test_subtracting_downward_inclusive_range_from_array_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) - (18..22)
    assert_equal ArrayOfRanges.new(10..15, 22..25), output
  end

  def test_subtracting_upward_inclusive_range_from_array_of_ranges
    output = ArrayOfRanges.new(10..15, 20..25) - (13..18)
    assert_equal ArrayOfRanges.new(10..13, 20..25), output
  end
  
end