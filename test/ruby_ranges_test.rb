require File.dirname(__FILE__) + '/../lib/ruby_ranges'
require 'test/unit'

class RubyRanges::RangeTest < Test::Unit::TestCase

  def test_include_partial_downward_range
    assert_equal -1, (1..9).include?(-1..3).to_value
    assert_equal RubyRanges::DownwardIncluded, (1..9).include?(-1..3)
  end

  def test_include_partial_upward_range
    assert_equal 1, (1..9).include?(7..11).to_value
    assert_equal RubyRanges::UpwardIncluded, (1..9).include?(7..11)
  end

  def test_include_wholly_inclusive_range
    assert_equal true, (1..9).include?(4..7).to_value
    assert_equal RubyRanges::WhollyIncluded, (1..9).include?(4..7)
  end

  def test_include_inverse_wholly_inclusive_range
    assert_equal nil, (4..7).include?(1..9).to_value
    assert_equal RubyRanges::InverseWhollyIncluded, (4..7).include?(1..9)
  end

  def test_include_exclusive_range
    assert_equal false, (1..9).include?(10..12).to_value
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
    assert_equal RubyRanges::ArrayOfRanges.new((1..4), (8..9)), output
  end

  def test_adding_array_of_ranges
    pending
  end

  def test_subtracting_wholly_included_range
    output = (1..9) - (5..7)
    assert_equal RubyRanges::ArrayOfRanges.new(1..5, 7..9), output
  end

  def test_subtracting_upward_inclusive_range
    output = (1..9) - (6..12)
    assert_equal 1..6, output
  end

  def test_subtracting_downward_inclusive_range
    output = (1..9) - (-1..4)
    assert_equal 4..9, output
  end

  def test_subtracting_surrounding_range
    assert_equal nil, (1..9) - (-1..10)
  end

  def test_subtracting_exclusive_range
    output = (1..9) - (11..12)
    assert_equal 1..9, output
  end

  def test_subtracting_wholly_inclusive_array_of_ranges
    pending
  end

  def test_subtracting_mutually_exclusive_array_of_ranges
    pending
  end

  def test_subtracting_downward_exclusive_array_of_ranges
    pending
  end

  def test_subtracting_upward_exclusive_array_of_ranges
    pending
  end
  
end