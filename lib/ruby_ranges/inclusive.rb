module RubyRanges
  
  class WhollyIncluded; def self.to_value; true; end; end
  class InverseWhollyIncluded; def self.to_value; nil; end; end
  class UpwardIncluded;  def self.to_value; 1; end; end
  class DownwardIncluded; def self.to_value; -1; end; end
  class MutuallyExcluded; def self.to_value; false; end; end
  
end