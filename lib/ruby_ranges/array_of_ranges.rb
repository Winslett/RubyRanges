module RubyRanges
  class ArrayOfRanges < Array

    alias :old_plus :+

    def initialize(*args)
      args.each { |arg| self << arg }
    end

    def +(object)
      raise "Expecting ArrayOfRanges or Range, but was #{object.inspect.class} : #{object.inspect}" unless object.is_a?(Range) || object.is_a?(ArrayOfRanges)
      array_of_ranges = ArrayOfRanges.new((object.is_a?(Range) ? (self.old_plus([object])) : super(object)))
      array_of_ranges.flatten_ranges
    end

    def flatten_ranges
      new = []
      
      flatten.sort_by(&:begin).each do |range|
        if new.last.nil?
          new << range
        else
          last = new.pop + range

          new = last.is_a?(RubyRanges::ArrayOfRanges) ?
            (new << last.to_a.flatten).flatten : (new << last)
          
        end
      end

      array = ArrayOfRanges.new(new).flatten
      array.length == 1 ? array[0] : array
    end

  end
end