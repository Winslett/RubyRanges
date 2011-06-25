class Array
  alias :old_plus :+
end

module RubyRanges
  class Array < Array

    alias :old_plus :+

    #
    # Takes the same arguments as Array.new:
    # 
    #   RubyRanges::Array.new(35..38, 55..72)
    #   RubyRanges::Array.new(Time.now..3.minutes.from_now, Time.now..3.minutes.ago)
    #
    # If you have a question whether it works. . . try it.  It might.
    #
    def initialize(*args)
      args.each { |arg| self << arg }
    end

    #
    # Takes either a Range or Array of Ranges
    #
    #   RubyRanges::Array.new(1..4, 8..11) + RubyRanges::Array.new(3..6, 7..9) =>
    #     RubyRanges::Array.new(1..6, 7..9)
    #
    #   RubyRanges::Array.new(1..4, 8..11) + (3..9) => 1..9
    #
    # This method will "flatten" any RubyRanges::Array which compasses the smallest to the largest.  It
    # will also compress an ranges which overlap.
    #
    def +(object)
      raise "Expecting RubyRanges::Array or Range, but was #{object.class} : #{object.inspect}" unless object.is_a?(Range) || object.is_a?(Array)
      array_of_ranges = Array.new((object.is_a?(Range) ? (self.old_plus([object])) : super(object)))
      array_of_ranges.flatten_ranges
    end

    #
    # Similar to +, takes either Range or Array of Ranges.
    #
    # This method splits apart ranges with an all encompassed subtrahend
    #
    def -(object)
      raise "Expecting RubyRanges::Array or Range, but was #{object.class} : #{object.inspect}" unless object.is_a?(Range) || object.is_a?(Array)
      if object.is_a?(Range)
        array_of_ranges = inject([]) do |new, range|
          new.old_plus([range - object])
        end
      else
        other = self
        object.each do |other_range|
          other = Array.new(other - other_range).flatten
        end
        other
      end
    end

    #
    # Flattens a RubyRanges::Array with overlapping Ranges.
    #
    def flatten_ranges
      new = []
      
      flatten.sort_by(&:begin).each do |range|
        if new.last.nil?
          new << range
        else
          last = new.pop + range

          new = last.is_a?(Array) ?
            new.old_plus(last) : (new << last)
        end
      end

      array = Array.new(new).flatten
      array.length == 1 ? array[0] : array
    end

  end
end
