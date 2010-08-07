class ArrayOfRanges < Array

  def initialize(*args)
    args.each { |arg| self << arg }
  end
  
end