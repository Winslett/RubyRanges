require File.dirname(__FILE__) + '/ruby_ranges/version.rb'
require File.dirname(__FILE__) + '/ruby_ranges/inclusive.rb'
require File.dirname(__FILE__) + '/ruby_ranges/range.rb'
require File.dirname(__FILE__) + '/ruby_ranges/array.rb'

class Range
  include RubyRanges::Range
end
