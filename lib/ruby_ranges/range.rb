class RubyRanges
  module Range
    def +(range)
      add_range(range)
    end

    private
    def add_range(range)
      case
      when self.include?(range.begin) && self.include?(range.end) # self swallows smaller range
        self
      when range.include?(self.begin) && range.include?(self.end) # self swallowed by larger range
        range
      when self.include?(range.begin) && self.end < range.end # add upward inclusive range
        self.begin..range.end
      when self.include?(range.end) && self.begin > range.begin # add downward inclusive range
        range.begin..self.end
      else # mutually exclusive
        ArrayOfRanges.new(self, range)
      end
    end
  end
end